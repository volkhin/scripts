#!/usr/bin/perl
use Term::ANSIColor;

$time=scalar(localtime);
chomp($time);
#Wed Sep 9 16:22:46 2009
$time =~ /(\w*)\s(\w*)\s*(\d*)\s([\d:]*)\s(\d*)/;

if (($2 eq 'Jan' ) or ($2 eq 'March' ) or ($2 eq 'May' ) or ($2 eq 'July' ) or ($2 eq 'Aug' ) or ($2 eq 'Oct' ) or ($2 eq 'Dec' ))
{
for ($i=0;$i<31;$i++)
{
@data[$i]=$i+1;
}
}
if ($2 eq 'Feb')
{
for ($i=0;$i<27;$i++)
{
@data[$i]=$i+1;
}
}
else
{
for ($i=0;$i<30;$i++)
{
@data[$i]=$i+1;
}
}
if (@ARGV[0] == 1)
{
for($i=0;$i<($3-1);$i++)
{ print "@data[$i] "; }
}
if (@ARGV[0] == 2)
{
print "$3";
}
if (@ARGV[0] == 3)
{
for($i=$3;@data[$i];$i++)
{ print "@data[$i] "; }
# print "@data[($3)..$i]";
}

