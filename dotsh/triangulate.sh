x1=1
x2=2
x3=3
y1=-1
y2=2
y3=-3
#midpoint
mx=$(awk "BEGIN {print ($x1+$x2)/2}")
my=$(awk "BEGIN {print ($y1+$y2)/2}")
#center
vara=$(awk "BEGIN {print $mx-($x3)}")
varb=$(awk "BEGIN {print $my-($y3)}")
vara=$(awk "BEGIN {print ($vara/3)*2}")
varb=$(awk "BEGIN {print ($varb/3)*2}")
x0=$(awk "BEGIN {print $x3+$vara}")
y0=$(awk "BEGIN {print $y3+$varb}")
echo "($x0, $y0)"