#!/usr/bin/env python

''' [cat |] %prog [-g id | -d id | file1 file2 ...] '''

__version__ = '0.2'

import netrc, os, sys

def auth():
    ''' netrc: machine ix.io login USERNAME password TOKEN '''
    try:
        auth = netrc.netrc().authenticators('ix.io')
    except:
        return {}
    if not auth:
        return {}
    return {'login' : auth[0], 'token' : auth[2] }

def mkreq(files, data={}, i=0):
    for filename in files:
        if filename is sys.stdin:
            if os.isatty(sys.stdin.fileno()):
                print '^C to exit, ^D to send'
            fname, ext = '', ''
            try:
                contents = sys.stdin.read()
            except KeyboardInterrupt:
                sys.exit()
            if not contents:
                sys.exit()
        elif os.path.exists(filename):
            contents = open(filename).read()
            filename, ext = os.path.splitext(filename)
            fname = os.path.basename(filename)
        else:
            continue
        i += 1
        data['f:%d' % i] = contents
        data['name:%d' % i] = fname
        data['ext:%d' % i] = ext
    return data

if __name__ == '__main__':
    from optparse import OptionParser
    from urllib import urlencode
    from urllib2 import urlopen
    parser = OptionParser(version=__version__,
                          usage=__doc__,
                          description=auth.__doc__)
    parser.add_option('-g', '--get', help='get paste identified by ID')
    parser.add_option('-d', '--delete', help='delete paste identified by ID')
    opts, args = parser.parse_args()
    if opts.get:
        print urlopen('http://ix.io/%s' % (opts.get)).read().strip()
    else:
        if not args:
            args = [sys.stdin]
        data = auth()
        if opts.delete:
            data['rm'] = opts.delete
        else:
            data.update(mkreq(args))
        print urlopen('http://ix.io', urlencode(data)).read().strip()
