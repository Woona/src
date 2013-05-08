#!/bin/bash
#graph
x=$1; y=$2; yy=y; xx=x
function clear_ {
	y5xn5=" "; y5xn4=" "; y5xn3=" "; y5xn2=" "; y5xn1=" "; y0x5=" "; y5x1=" "; y5x2=" "; y5x3=" "; y5x4=" "; y5x5=" "
	y4xn5=" "; y4xn4=" "; y4xn3=" "; y4xn2=" "; y4xn1=" "; y0x4=" "; y4x1=" "; y4x2=" "; y4x3=" "; y4x4=" "; y4x5=" "
	y3xn5=" "; y3xn4=" "; y3xn3=" "; y3xn2=" "; y3xn1=" "; y0x3=" "; y3x1=" "; y3x2=" "; y3x3=" "; y3x4=" "; y3x5=" "
	y2xn5=" "; y2xn4=" "; y2xn3=" "; y2xn2=" "; y2xn1=" "; y0x2=" "; y2x1=" "; y2x2=" "; y2x3=" "; y2x4=" "; y2x5=" "
	y1xn5=" "; y1xn4=" "; y1xn3=" "; y1xn2=" "; y1xn1=" "; y0x1=" "; y1x1=" "; y1x2=" "; y1x3=" "; y1x4=" "; y1x5=" "
	y0xn5=" "; y0xn4=" "; y0xn3=" "; y0xn2=" "; y0xn1=" "; y0x0="+"; y0x1=" "; y0x2=" "; y0x3=" "; y0x4=" "; y0x5=" "
	yn1xn1=" "; yn1xn4=" "; yn1xn3=" "; yn1xn2=" "; yn1xn1=" "; y0x1=" "; yn1x1=" "; yn1x2=" "; yn1x3=" "; yn1x4=" "; yn1x5=" "
	yn2xn2=" "; yn2xn4=" "; yn2xn3=" "; yn2xn2=" "; yn2xn1=" "; y0x2=" "; yn2x1=" "; yn2x2=" "; yn2x3=" "; yn2x4=" "; yn2x5=" "
	yn3xn3=" "; yn3xn4=" "; yn3xn3=" "; yn3xn2=" "; yn3xn1=" "; y0x3=" "; yn3x1=" "; yn3x2=" "; yn3x3=" "; yn3x4=" "; yn3x5=" "
	yn4xn4=" "; yn4xn4=" "; yn4xn3=" "; yn4xn2=" "; yn4xn1=" "; y0x4=" "; yn4x1=" "; yn4x2=" "; yn4x3=" "; yn4x4=" "; yn4x5=" "
	yn5xn5=" "; yn5xn4=" "; yn5xn3=" "; yn5xn2=" "; yn5xn1=" "; y0x5=" "; yn5x1=" "; yn5x2=" "; yn5x3=" "; yn5x4=" "; yn5x5=" "
}
function disp_ {
	echo " $y5xn5 $y5xn4 $y5xn3 $y5xn2 $y5xn1 $y0x5 $y5x1 $y5x2 $y5x3 $y5x4 $y5x5 "
	echo " $y4xn5 $y4xn4 $y4xn3 $y4xn2 $y4xn1 $y0x4 $y4x1 $y4x2 $y4x3 $y4x4 $y4x5 "
	echo " $y3xn5 $y3xn4 $y3xn3 $y3xn2 $y3xn1 $y0x3 $y3x1 $y3x2 $y3x3 $y3x4 $y3x5 "
	echo " $y2xn5 $y2xn4 $y2xn3 $y2xn2 $y2xn1 $y0x2 $y2x1 $y2x2 $y2x3 $y2x4 $y2x5 "
	echo " $y1xn5 $y1xn4 $y1xn3 $y1xn2 $y1xn1 $y0x1 $y1x1 $y1x2 $y1x3 $y1x4 $y1x5 "
	echo " $y0xn5 $y0xn4 $y0xn3 $y0xn2 $y0xn1 $y0x0 $y0x1 $y0x2 $y0x3 $y0x4 $y0x5 "
	echo " $yn1xn1 $yn1xn4 $yn1xn3 $yn1xn2 $yn1xn1 $y0x1 $yn1x1 $yn1x2 $yn1x3 $yn1x4 $yn1x5 "
	echo " $yn2xn2 $yn2xn4 $yn2xn3 $yn2xn2 $yn2xn1 $y0x2 $yn2x1 $yn2x2 $yn2x3 $yn2x4 $yn2x5 "
	echo " $yn3xn3 $yn3xn4 $yn3xn3 $yn3xn2 $yn3xn1 $y0x3 $yn3x1 $yn3x2 $yn3x3 $yn3x4 $yn3x5 "
	echo " $yn4xn4 $yn4xn4 $yn4xn3 $yn4xn2 $yn4xn1 $y0x4 $yn4x1 $yn4x2 $yn4x3 $yn4x4 $yn4x5 "
	echo " $yn5xn5 $yn5xn4 $yn5xn3 $yn5xn2 $yn5xn1 $y0x5 $yn5x1 $yn5x2 $yn5x3 $yn5x4 $yn5x5 "
}
function round_ {
	x=$(echo $x | sed 's/[-]/n/g;s/[.]/ /g' | awk '{print $1}')
	y=$(echo $y | sed 's/[-]/n/g;s/[.]/ /g' | awk '{print $1}')
}
function plot_ {
	vname=$yy$y$xx$x
	eval ${vname}="*"
}
clear_ 
round_ $x $y
plot_
disp_