function makeclient { 
	if [[ $1 = p1 ]]; then
		echo '#!/bin/bash
rmdir="`dirname \"$0\"`"
function save {
	if [[ $1 = p1 ]]; then
		if [[ $2 = nohealth ]]; then
			echo "$p1laser" > $rmdir/laser
			echo "$p1x" > $rmdir/x
			echo "$p1shield" > $rmdir/shield
		elif [[ $2 = health ]]; then
			echo "$p1health" > $rmdir/health
		elif [[ $2 = laser ]]; then
			echo "$p1laser" > $rmdir/laser
		else
			echo "$p1laser" > $rmdir/laser
			echo "$p1x" > $rmdir/x
			echo "$p1health" > $rmdir/health
			echo "$p1shield" > $rmdir/shield
		fi
	elif [[ $1 = p2 ]]; then
		if [[ $2 = nohealth ]]; then
			echo "$p2laser" > $rmdir/../p2/laser
			echo "$p2x" > $rmdir/../p2/x
			echo "$p2shield" > $rmdir/../p2/shield
			echo "$p2weapon" > $rmdir/../p2/weapon
		elif [[ $2 = health ]]; then
			echo "$p2health" > $rmdir/../p2/health
		elif [[ $2 = laser ]]; then
			echo "$p2laser" > $rmdir/../p2/laser
		else
			echo "$p2laser" > $rmdir/../p2/laser
			echo "$p2x" > $rmdir/../p2/x
			echo "$p2health" > $rmdir/../p2/health
			echo "$p2shield" > $rmdir/../p2/shield
			echo "$p2weapon" > $rmdir/../p2/weapon
		fi
	fi
}
function load { p1dir="/Users/Shared/shellspaceserver/p1/"; p2dir="/Users/Shared/shellspaceserver/p2/"; weapon=$p1weapon
	if [[ $1 = p1 ]]; then
		if [[ $2 = nohealth ]]; then
			p1laser=$(cat $rmdir/laser)
			p1x=$(cat $rmdir/x)
			p1shield=$(cat $rmdir/shield)
		elif [[ $2 = health ]]; then
			p1health=$(cat $rmdir/health)
		else
			p1laser=$(cat $rmdir/laser)
			p1x=$(cat $rmdir/x)
			p1health=$(cat $rmdir/health)
			p1shield=$(cat $rmdir/shield)
			p1weapon=$(cat $rmdir/weapon)
		fi
	elif [[ $1 = p2 ]]; then
		if [[ $2 = nohealth ]]; then
			p2laser=$(cat $rmdir/../p2/laser)
			p2x=$(cat $rmdir/../p2/x)
			p2shield=$(cat $rmdir/../p2/shield)
			p2weapon=$(cat $rmdir/../p2/weapon)
		elif [[ $2 = health ]]; then
			p2health=$(cat $rmdir/../p2/health)
		else
			p2laser=$(cat $rmdir/../p2/laser)
			p2x=$(cat $rmdir/../p2/x)
			p2health=$(cat $rmdir/../p2/health)
			p2shield=$(cat $rmdir/../p2/shield)
			p2weapon=$(cat $rmdir/../p2/weapon)
		fi
	fi
}
function mclear { 
	m1=" "; m2=" "; m3=" "; m4=" "; m5=" "; m6=" "; m7=" "; m8=" "; m9=" "; m0=" ";
	s1=" "; s2=" "; s3=" "; s4=" "; s5=" "; s6=" "; s7=" "; s8=" "; s9=" "; s10=" "; 
}
function laser { load p2; load p1;
	if [[ $1 = p1 ]]; then
		if [[ $m1 = ">" ]]; then 
			if [[ $weapon = 1 ]]; then 
				l1="-"; 
				if [[ $p2shield = 0 ]]; then
					if [[ $m6 = "<" ]]; then ((p2health=$p2health-$((RANDOM%8)))); fi
				fi
			elif [[ $weapon = 2 ]]; 
				then l1="-"; l2="-"; 
				if [[ $p2shield = 0 ]]; then
					if [[ $m6 = "<" ]] || [[ $m7 = "<" ]]; then ((p2health=$p2health-$((RANDOM%8+1)))); fi
				fi
			fi 
			p1laser=0; save p1 laser; save p2 health
		elif [[ $m2 = ">" ]]; then 
			if [[ $weapon = 1 ]]; then 
				l2="-"; 
				if [[ $p2shield = 0 ]]; then
					if [[ $m7 = "<" ]]; then ((p2health=$p2health-$((RANDOM%8)))); fi
				fi
			elif [[ $weapon = 2 ]]; then 
				l1="-"; l2="-"; l3="-"; 
				if [[ $p2shield = 0 ]]; then
					if [[ $m6 = "<" ]] || [[ $m7 = "<" ]] || [[ $m8 = "<" ]]; then ((p2health=$p2health-$((RANDOM%8+1)))); fi
				fi
			fi
			p1laser=0; save p1 laser; save p2 health
		elif [[ $m3 = ">" ]]; then 
			if [[ $weapon = 1 ]]; then 
				l3="-"; 
				if [[ $p2shield = 0 ]]; then
					if [[ $m8 = "<" ]]; then ((p2health=$p2health-$((RANDOM%8)))); fi
				fi
			elif [[ $weapon = 2 ]]; then 
				l2="-"; l3="-"; l4="-"; 
				if [[ $p2shield = 0 ]]; then
					if [[ $m7 = "<" ]] || [[ $m8 = "<" ]] || [[ $m9 = "<" ]]; then ((p2health=$p2health-$((RANDOM%8+1)))); fi
				fi
			fi
			p1laser=0; save p1 laser; save p2 health
		elif [[ $m4 = ">" ]]; then 
			if [[ $weapon = 1 ]]; then 
				l4="-"; 
				if [[ $p2shield = 0 ]]; then
					if [[ $m9 = "<" ]]; then ((p2health=$p2health-$((RANDOM%8)))); fi
				fi
			elif [[ $weapon = 2 ]]; then 
				l3="-"; l4="-"; l5="-"; 
				if [[ $p2shield = 0 ]]; then
					if [[ $m8 = "<" ]] || [[ $m9 = "<" ]] || [[ $m10 = "<" ]]; then ((p2health=$p2health-$((RANDOM%8+1)))); fi
				fi
			fi
			p1laser=0; save p1 laser; save p2 health
		elif [[ $m5 = ">" ]]; then 
			if [[ $weapon = 1 ]]; then 
				l5="-"; 
				if [[ $p2shield = 0 ]]; then
					if [[ $m10 = "<" ]]; then ((p2health=$p2health-$((RANDOM%8)))); fi
				fi
			elif [[ $weapon = 2 ]]; then 
				l4="-"; l5="-";
				if [[ $p2shield = 0 ]]; then
					if  [[ $m9 = "<" ]] || [[ $m10 = "<" ]]; then ((p2health=$p2health-$((RANDOM%8+1)))); fi
				fi
			fi
			p1laser=0; save p1 laser; save p2 health
		fi
	elif [[ $1 = p2 ]]; then
		if [[ $m6 = "<" ]]; then 
			if [[ $p2weapon = 1 ]]; then 
				l1="+"; 
				if [[ $p1shield = 0 ]];then 
					if [[ $m1 = ">" ]]; then ((p1health=$p1health-$((RANDOM%8)))); fi
				fi
			elif [[ $p2weapon = 2 ]]; then 
				l1="+"; l2="+"; 
				if [[ $p1shield = 0 ]];then 
					if [[ $m1 = ">" ]] || [[ $m2 = ">" ]]; then ((p1health=$p1health-$((RANDOM%8)))); fi
				fi
			fi 
			p2laser=0; save a1 laser; save p1 health;
		elif [[ $m7 = "<" ]]; then 
			if [[ $p2weapon = 1 ]]; then 
				l2="+"; 
				if [[ $p1shield = 0 ]];then 
					if [[ $m2 = ">" ]]; then ((p1health=$p1health-$((RANDOM%8)))); fi
				fi
			elif [[ $p2weapon = 2 ]]; then 
				l1="+"; l2="+"; l3="+"; 
				if [[ $p1shield = 0 ]];then 
					if [[ $m1 = ">" ]] || [[ $m2 = ">" ]] || [[ $m3 = ">" ]]; then ((p1health=$p1health-$((RANDOM%8)))); fi
				fi
			fi
			p2laser=0; save a1 laser; save p1 health;
		elif [[ $m8 = "<" ]]; then
			if [[ $p2weapon = 1 ]]; then 
				l3="+"; 
				if [[ $p1shield = 0 ]];then 
					if [[ $m3 = ">" ]]; then ((p1health=$p1health-$((RANDOM%8)))); fi
				fi
			elif [[ $p2weapon = 2 ]]; then 
				l2="+"; l3="+"; l4="+"; 
				if [[ $p1shield = 0 ]];then 
					if [[ $m2 = ">" ]] || [[ $m3 = ">" ]] || [[ $m4 = ">" ]]; then ((p1health=$p1health-$((RANDOM%8)))); fi
				fi
			fi
			p2laser=0; save a1 laser; save p1 health;
		elif [[ $m9 = "<" ]]; then
			if [[ $p2weapon = 1 ]]; then 
				l4="+"; 
				if [[ $p1shield = 0 ]];then 
					if [[ $m4 = ">" ]]; then ((p1health=$p1health-$((RANDOM%8)))); fi
				fi
			elif [[ $p2weapon = 2 ]]; then 
				l3="+"; l4="+"; l5="+"; 
				if [[ $p1shield = 0 ]];then 
					if [[ $m3 = ">" ]] || [[ $m4 = ">" ]] || [[ $m5 = ">" ]]; then ((p1health=$p1health-$((RANDOM%8)))); fi
				fi
			fi
			p2laser=0; save a1 laser; save p1 health;
		elif [[ $m0 = "<" ]]; then
			if [[ $p2weapon = 1 ]]; then 
				l5="+"; 
				if [[ $p1shield = 0 ]];then 
					if [[ $m5 = ">" ]]; then ((p1health=$p1health-$((RANDOM%8)))); fi 
				fi
			elif [[ $p2weapon = 2 ]]; then 
				l4="+"; l5="+"; 
				if [[ $p1shield = 0 ]];then
					if [[ $m4 = ">" ]] || [[ $m5 = ">" ]]; then ((p1health=$p1health-$((RANDOM%8)))); fi 
				fi
			fi
			p2laser=0; save a1 laser; save p1 health;
		fi
	fi
}
function shield {
	if [[ $1 = p1 ]]; then
		if [[ $m1 = ">" ]]; then 
			s1="]"
		elif [[ $m2 = ">" ]]; then 
			s2="]"
		elif [[ $m3 = ">" ]]; then 
			s3="]"
		elif [[ $m4 = ">" ]]; then 
			s4="]"
		elif [[ $m5 = ">" ]]; then 
			s5="]"
		fi
	elif [[ $1 = p2 ]]; then
		if [[ $m6 = "<" ]]; then 
			s6="["
		elif [[ $m7 = "<" ]]; then 
			s7="["
		elif [[ $m8 = "<" ]]; then
			s8="["
		elif [[ $m9 = "<" ]]; then
			s9="["
		elif [[ $m0 = "<" ]]; then
			s10="["
		fi
	fi
}
function display { load p2; load p1; mclear
	l1=" "; l2=" "; l3=" "; l4=" "; l5=" "
	if [[ $p1x = 1 ]]; then 
		m1=">"; 
	elif [[ $p1x = 2 ]]; then 
		m2=">";
	elif [[ $p1x = 3 ]]; then
		m3=">";
	elif [[ $p1x = 4 ]]; then
		m4=">";
	elif [[ $p1x = 5 ]]; then
		m5=">";
	fi
	if [[ $p2x = 1 ]]; then 
		m6="<"; 
	elif [[ $p2x = 2 ]]; then 
		m7="<";
	elif [[ $p2x = 3 ]]; then
		m8="<";
	elif [[ $p2x = 4 ]]; then
		m9="<";
	elif [[ $p2x = 5 ]]; then
		m0="<";
	fi
	if [[ $p1shield = 1 ]]; then
		shield p1; p1laser=0
	elif [[ $p1laser = 1 ]]; then
		laser p1; p1laser=0
	fi
	if [[ $p2shield = 1 ]]; then
		shield p2; p2shield=0
	elif [[ $p2laser = 1 ]]; then
		laser p2; p2laser=0
	fi
	if [[ $p1health -lt 1 ]] && [[ $p2health -lt 1 ]]; then
		p1health=0; p2health=0; win=2
	elif [[ $p1health -lt 1 ]]; then 
		p1health=0; win=0
	elif [[ $p2health -lt 1 ]]; then
		p2health=0; win=1
	fi
	echo -e "$m1" "$s1" "$l1" "$l1" "$l1" "$l1" "$l1" "$s6" "$m6 $uname: $p1health%"
	echo -e "$m2" "$s2" "$l2" "$l2" "$l2" "$l2" "$l2" "$s7" "$m7 $tname: $p2health%"
	echo -e "$m3" "$s3" "$l3" "$l3" "$l3" "$l3" "$l3" "$s8" "$m8"
	echo -e "$m4" "$s4" "$l4" "$l4" "$l4" "$l4" "$l4" "$s9" "$m9"
	echo -e "$m5" "$s5" "$l5" "$l5" "$l5" "$l5" "$l5" "$s10" "$m0"
	#if [[ $win = 0 ]]; then clear
	#	echo "You Lose"; echo "1" > $rmdir/../exit; sleep 1
	#elif [[ $win = 1 ]]; then clear
	#	echo "You Win"; echo "1" > $rmdir/../exit; sleep 1
	#elif [[ $win = 2 ]]; then clear
	#	echo "Tie"; echo "1" > $rmdir/../exit; sleep 1
	#fi
}
function offline { clear; p1health=100; p1x=1; p1laser=0; p1shield=0;
 	save p1; exit=false
	while [[ $exit = false ]]; do
		while [[ $(cat $rmdir/../exit) = 0 ]]; do clear
			display; sleep 0.08
		done&
		while [[  $(cat $rmdir/../exit) = 0 ]]; do
			read -s -n 1 mv
			if [[ $mv = s ]]; then
				((p1x=$p1x+1)); if [[ $p1x -gt 5 ]]; then p1x=5; fi; laser=0; save p1 nohealth
			elif [[ $mv = w ]]; then
				((p1x=$p1x-1)); if [[ $p1x -lt 1 ]]; then p1x=1; fi; laser=0; save p1 nohealth
			elif [[ $mv = d ]]; then
				p1shield=1; save p1 nohealth; p1shield=0
			elif [[ -z $mv ]]; then
				p1laser=1; save p1 nohealth; p1laser=0
			fi
		done
		if [[ $(cat $rmdir/../exit) = 1 ]]; then 
			exit=true; 
		fi
	done
}
until [[ -f $rmdir/../p2/uname ]]; do
	echo Waiting for more players.; sleep 0.5; clear;
	echo Waiting for more players..; sleep 0.5; clear;
	echo Waiting for more players...; sleep 0.5; clear;
done
clear; echo "Starting in 3..."; sleep 1; echo "            2..."; sleep 1; echo "            1..."; sleep 1;
offline' > /Users/Shared/sss/$grm/p1/client
	elif [[ $1 = p2 ]]; then
		echo '#!/bin/bash
rmdir="`dirname \"$0\"`"
function save {
	if [[ $1 = p1 ]]; then
		if [[ $2 = nohealth ]]; then
			echo "$p1laser" > $rmdir/../p1/laser
			echo "$p1x" > $rmdir/../p1/x
			echo "$p1shield" > $rmdir/../p1/shield
		elif [[ $2 = health ]]; then
			echo "$p1health" > $rmdir/../p1/health
		elif [[ $2 = laser ]]; then
			echo "$p1laser" > $rmdir/../p1/laser
		else
			echo "$p1laser" > $rmdir/../p1/laser
			echo "$p1x" > $rmdir/../p1/x
			echo "$p1health" > $rmdir/../p1/health
			echo "$p1shield" > $rmdir/../p1/shield
		fi
	elif [[ $1 = p2 ]]; then
		if [[ $2 = nohealth ]]; then
			echo "$p2laser" > $rmdir/laser
			echo "$p2x" > $rmdir/x
			echo "$p2shield" > $rmdir/shield
			echo "$p2weapon" > $rmdir/weapon
		elif [[ $2 = health ]]; then
			echo "$p2health" > $rmdir/health
		elif [[ $2 = laser ]]; then
			echo "$p2laser" > $rmdir/laser
		else
			echo "$p2laser" > $rmdir/laser
			echo "$p2x" > $rmdir/x
			echo "$p2health" > $rmdir/health
			echo "$p2shield" > $rmdir/shield
			echo "$p2weapon" > $rmdir/weapon
		fi
	fi
}
function load { p1dir="/Users/Shared/shellspaceserver/p1/"; p2dir="/Users/Shared/shellspaceserver/p2/"
	if [[ $1 = p1 ]]; then
		if [[ $2 = nohealth ]]; then
			p1laser=$(cat $rmdir/../p1/laser)
			p1x=$(cat $rmdir/../p1/x)
			p1shield=$(cat $rmdir/../p1/shield)
		elif [[ $2 = health ]]; then
			p1health=$(cat $rmdir/../p1/health)
		else
			p1laser=$(cat $rmdir/../p1/laser)
			p1x=$(cat $rmdir/../p1/x)
			p1health=$(cat $rmdir/../p1/health)
			p1shield=$(cat $rmdir/../p1/shield)
			p1weapon=$(cat $rmdir/../p1/weapon)
		fi
	elif [[ $1 = p2 ]]; then
		if [[ $2 = nohealth ]]; then
			p2laser=$(cat $rmdir/laser)
			p2x=$(cat $rmdir/x)
			p2shield=$(cat $rmdir/shield)
			p2weapon=$(cat $rmdir/weapon)
		elif [[ $2 = health ]]; then
			p2health=$(cat $rmdir/health)
		else
			p2laser=$(cat $rmdir/laser)
			p2x=$(cat $rmdir/x)
			p2health=$(cat $rmdir/health)
			p2shield=$(cat $rmdir/shield)
			p2weapon=$(cat $rmdir/weapon)
		fi
	fi
}
function mclear { 
	m1=" "; m2=" "; m3=" "; m4=" "; m5=" "; m6=" "; m7=" "; m8=" "; m9=" "; m0=" ";
	s1=" "; s2=" "; s3=" "; s4=" "; s5=" "; s6=" "; s7=" "; s8=" "; s9=" "; s10=" "; 
}
function laser { load p2; load p1; weapon=$p1weapon
	if [[ $1 = p1 ]]; then
		if [[ $m1 = ">" ]]; then 
			if [[ $weapon = 1 ]]; then 
				l1="-"; 
				if [[ $p2shield = 0 ]]; then
					if [[ $m6 = "<" ]]; then ((p2health=$p2health-$((RANDOM%8)))); fi
				fi
			elif [[ $weapon = 2 ]]; 
				then l1="-"; l2="-"; 
				if [[ $p2shield = 0 ]]; then
					if [[ $m6 = "<" ]] || [[ $m7 = "<" ]]; then ((p2health=$p2health-$((RANDOM%8+1)))); fi
				fi
			fi 
			p1laser=0; save p1 laser; save p2 health
		elif [[ $m2 = ">" ]]; then 
			if [[ $weapon = 1 ]]; then 
				l2="-"; 
				if [[ $p2shield = 0 ]]; then
					if [[ $m7 = "<" ]]; then ((p2health=$p2health-$((RANDOM%8)))); fi
				fi
			elif [[ $weapon = 2 ]]; then 
				l1="-"; l2="-"; l3="-"; 
				if [[ $p2shield = 0 ]]; then
					if [[ $m6 = "<" ]] || [[ $m7 = "<" ]] || [[ $m8 = "<" ]]; then ((p2health=$p2health-$((RANDOM%8+1)))); fi
				fi
			fi
			p1laser=0; save p1 laser; save p2 health
		elif [[ $m3 = ">" ]]; then 
			if [[ $weapon = 1 ]]; then 
				l3="-"; 
				if [[ $p2shield = 0 ]]; then
					if [[ $m8 = "<" ]]; then ((p2health=$p2health-$((RANDOM%8)))); fi
				fi
			elif [[ $weapon = 2 ]]; then 
				l2="-"; l3="-"; l4="-"; 
				if [[ $p2shield = 0 ]]; then
					if [[ $m7 = "<" ]] || [[ $m8 = "<" ]] || [[ $m9 = "<" ]]; then ((p2health=$p2health-$((RANDOM%8+1)))); fi
				fi
			fi
			p1laser=0; save p1 laser; save p2 health
		elif [[ $m4 = ">" ]]; then 
			if [[ $weapon = 1 ]]; then 
				l4="-"; 
				if [[ $p2shield = 0 ]]; then
					if [[ $m9 = "<" ]]; then ((p2health=$p2health-$((RANDOM%8)))); fi
				fi
			elif [[ $weapon = 2 ]]; then 
				l3="-"; l4="-"; l5="-"; 
				if [[ $p2shield = 0 ]]; then
					if [[ $m8 = "<" ]] || [[ $m9 = "<" ]] || [[ $m10 = "<" ]]; then ((p2health=$p2health-$((RANDOM%8+1)))); fi
				fi
			fi
			p1laser=0; save p1 laser; save p2 health
		elif [[ $m5 = ">" ]]; then 
			if [[ $weapon = 1 ]]; then 
				l5="-"; 
				if [[ $p2shield = 0 ]]; then
					if [[ $m10 = "<" ]]; then ((p2health=$p2health-$((RANDOM%8)))); fi
				fi
			elif [[ $weapon = 2 ]]; then 
				l4="-"; l5="-";
				if [[ $p2shield = 0 ]]; then
					if  [[ $m9 = "<" ]] || [[ $m10 = "<" ]]; then ((p2health=$p2health-$((RANDOM%8+1)))); fi
				fi
			fi
			p1laser=0; save p1 laser; save p2 health
		fi
	elif [[ $1 = p2 ]]; then
		if [[ $m6 = "<" ]]; then 
			if [[ $p2weapon = 1 ]]; then 
				l1="+"; 
				if [[ $p1shield = 0 ]];then 
					if [[ $m1 = ">" ]]; then ((p1health=$p1health-$((RANDOM%8)))); fi
				fi
			elif [[ $p2weapon = 2 ]]; then 
				l1="+"; l2="+"; 
				if [[ $p1shield = 0 ]];then 
					if [[ $m1 = ">" ]] || [[ $m2 = ">" ]]; then ((p1health=$p1health-$((RANDOM%8)))); fi
				fi
			fi 
			p2laser=0; save a1 laser; save p1 health;
		elif [[ $m7 = "<" ]]; then 
			if [[ $p2weapon = 1 ]]; then 
				l2="+"; 
				if [[ $p1shield = 0 ]];then 
					if [[ $m2 = ">" ]]; then ((p1health=$p1health-$((RANDOM%8)))); fi
				fi
			elif [[ $p2weapon = 2 ]]; then 
				l1="+"; l2="+"; l3="+"; 
				if [[ $p1shield = 0 ]];then 
					if [[ $m1 = ">" ]] || [[ $m2 = ">" ]] || [[ $m3 = ">" ]]; then ((p1health=$p1health-$((RANDOM%8)))); fi
				fi
			fi
			p2laser=0; save a1 laser; save p1 health;
		elif [[ $m8 = "<" ]]; then
			if [[ $p2weapon = 1 ]]; then 
				l3="+"; 
				if [[ $p1shield = 0 ]];then 
					if [[ $m3 = ">" ]]; then ((p1health=$p1health-$((RANDOM%8)))); fi
				fi
			elif [[ $p2weapon = 2 ]]; then 
				l2="+"; l3="+"; l4="+"; 
				if [[ $p1shield = 0 ]];then 
					if [[ $m2 = ">" ]] || [[ $m3 = ">" ]] || [[ $m4 = ">" ]]; then ((p1health=$p1health-$((RANDOM%8)))); fi
				fi
			fi
			p2laser=0; save a1 laser; save p1 health;
		elif [[ $m9 = "<" ]]; then
			if [[ $p2weapon = 1 ]]; then 
				l4="+"; 
				if [[ $p1shield = 0 ]];then 
					if [[ $m4 = ">" ]]; then ((p1health=$p1health-$((RANDOM%8)))); fi
				fi
			elif [[ $p2weapon = 2 ]]; then 
				l3="+"; l4="+"; l5="+"; 
				if [[ $p1shield = 0 ]];then 
					if [[ $m3 = ">" ]] || [[ $m4 = ">" ]] || [[ $m5 = ">" ]]; then ((p1health=$p1health-$((RANDOM%8)))); fi
				fi
			fi
			p2laser=0; save a1 laser; save p1 health;
		elif [[ $m0 = "<" ]]; then
			if [[ $p2weapon = 1 ]]; then 
				l5="+"; 
				if [[ $p1shield = 0 ]];then 
					if [[ $m5 = ">" ]]; then ((p1health=$p1health-$((RANDOM%8)))); fi 
				fi
			elif [[ $p2weapon = 2 ]]; then 
				l4="+"; l5="+"; 
				if [[ $p1shield = 0 ]];then
					if [[ $m4 = ">" ]] || [[ $m5 = ">" ]]; then ((p1health=$p1health-$((RANDOM%8)))); fi 
				fi
			fi
			p2laser=0; save a1 laser; save p1 health;
		fi
	fi
}
function shield {
	if [[ $1 = p1 ]]; then
		if [[ $m1 = ">" ]]; then 
			s1="]"
		elif [[ $m2 = ">" ]]; then 
			s2="]"
		elif [[ $m3 = ">" ]]; then 
			s3="]"
		elif [[ $m4 = ">" ]]; then 
			s4="]"
		elif [[ $m5 = ">" ]]; then 
			s5="]"
		fi
	elif [[ $1 = p2 ]]; then
		if [[ $m6 = "<" ]]; then 
			s6="["
		elif [[ $m7 = "<" ]]; then 
			s7="["
		elif [[ $m8 = "<" ]]; then
			s8="["
		elif [[ $m9 = "<" ]]; then
			s9="["
		elif [[ $m0 = "<" ]]; then
			s10="["
		fi
	fi
}
function display { load p2; load p1; mclear
	l1=" "; l2=" "; l3=" "; l4=" "; l5=" "
	if [[ $p1x = 1 ]]; then 
		m1=">"; 
	elif [[ $p1x = 2 ]]; then 
		m2=">";
	elif [[ $p1x = 3 ]]; then
		m3=">";
	elif [[ $p1x = 4 ]]; then
		m4=">";
	elif [[ $p1x = 5 ]]; then
		m5=">";
	fi
	if [[ $p2x = 1 ]]; then 
		m6="<"; 
	elif [[ $p2x = 2 ]]; then 
		m7="<";
	elif [[ $p2x = 3 ]]; then
		m8="<";
	elif [[ $p2x = 4 ]]; then
		m9="<";
	elif [[ $p2x = 5 ]]; then
		m0="<";
	fi
	if [[ $p1shield = 1 ]]; then
		shield p1; p1laser=0
	elif [[ $p1laser = 1 ]]; then
		laser p1; p1laser=0
	fi
	if [[ $p2shield = 1 ]]; then
		shield p2; p2shield=0
	elif [[ $p2laser = 1 ]]; then
		laser p2; p2laser=0
	fi
	if [[ $p1health -lt 1 ]] && [[ $p2health -lt 1 ]]; then
		p1health=0; p2health=0; win=2
	elif [[ $p1health -lt 1 ]]; then 
		p1health=0; win=0
	elif [[ $p2health -lt 1 ]]; then
		p2health=0; win=1
	fi
	echo -e "$m1" "$s1" "$l1" "$l1" "$l1" "$l1" "$l1" "$s6" "$m6 $uname: $p1health%"
	echo -e "$m2" "$s2" "$l2" "$l2" "$l2" "$l2" "$l2" "$s7" "$m7 $tname: $p2health%"
	echo -e "$m3" "$s3" "$l3" "$l3" "$l3" "$l3" "$l3" "$s8" "$m8"
	echo -e "$m4" "$s4" "$l4" "$l4" "$l4" "$l4" "$l4" "$s9" "$m9"
	echo -e "$m5" "$s5" "$l5" "$l5" "$l5" "$l5" "$l5" "$s10" "$m0"
	#if [[ $win = 1 ]]; then clear
	#	echo "You Lose"; echo "1" > $rmdir/../exit; sleep 1
	#elif [[ $win = 0 ]]; then clear
	#	echo "You Win"; echo "1" > $rmdir/../exit; sleep 1
	#elif [[ $win = 2 ]]; then clear
	#	echo "Tie"; echo "1" > $rmdir/../exit; sleep 1
	#fi
}
function offline { clear; p2health=100; p2x=1; p2laser=0; p2shield=0; p1x=1; p1laser=0; p1health=100; p1shield=0;
 	save p2; exit=false
	while [[ $exit = false ]]; do
		while [[ $(cat $rmdir/../exit) = 0 ]]; do clear
			display; sleep 0.08
		done&
		while [[  $(cat $rmdir/../exit) = 0 ]]; do
			read -s -n 1 mv
			if [[ $mv = s ]]; then
				((p2x=$p2x+1)); if [[ $p2x -gt 5 ]]; then p2x=5; fi; laser=0; save p2 nohealth
			elif [[ $mv = w ]]; then
				((p2x=$p2x-1)); if [[ $p2x -lt 1 ]]; then p2x=1; fi; laser=0; save p2 nohealth
			elif [[ $mv = d ]]; then
				p2shield=1; save p2 nohealth; p2shield=0
			elif [[ -z $mv ]]; then
				p2laser=1; save p2 nohealth; p2laser=0
			fi
		done
		if [[ $(cat $rmdir/../exit) = 1 ]]; then 
			exit=true; 
		fi
	done
}
until [[ -f $rmdir/../p1/uname ]]; do
	echo Waiting for more players.; sleep 0.5; clear
	echo Waiting for more players..; sleep 0.5; clear
	echo Waiting for more players...; sleep 0.5; clear
done
clear; echo "Starting in 3..."; sleep 1; echo "            2..."; sleep 1; echo "            1..."; sleep 1;
offline' > /Users/Shared/sss/$grm/p2/client
	fi
}