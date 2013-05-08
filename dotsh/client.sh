#!/bin/bash
version="1.5"
function makedirs {
	if [[ $1 = first ]]; then
		if [[ ! -d /Users/Shared/sss ]]; then mkdir /Users/Shared/sss; fi
		if [[ ! -d /Users/Shared/sss/chat ]]; then mkdir /Users/Shared/sss/chat; fi
		if [[ ! -d /Users/Shared/sss/info ]]; then mkdir /Users/Shared/sss/info /Users/Shared/sss/info/online /Users/Shared/sss/info/banned; fi
		if [[ ! -f /Users/Shared/sss/chat/chat ]]; then echo -e "Chat Started\n---------\n" >> /Users/Shared/sss/chat/chat; fi
		echo "0" > /Users/Shared/sss/exit
	elif [[ $1 = room ]]; then
		rnum=1
		until [[ ! -d /Users/Shared/sss/$rnum ]]; do
			((rnum=$rnum+1))
		done
		mkdir /Users/Shared/sss/$rnum /Users/Shared/sss/$rnum/p1 /Users/Shared/sss/$rnum/p2; 
		grm=$rnum; makeclient p1; makeclient p2; echo 0 > /Users/Shared/sss/$rnum/exit
	fi
}
if [[ $1 = client ]]; then chat=false; uname=$2; weapon=$3; xp=$4;
	if [[ $(cat /Users/Shared/sss/info/online/$uname) = 1 ]]; then echo Error, You are already online; echo "Player $uname attempted to connect twice" >> /Users/Shared/sss/chat/achat; exit; fi
	if [[ $(cat /Users/Shared/sss/info/banned/$uname) = 1 ]]; then echo Error, You are banned from this server; echo "Player $uname attempted to connect while banned" >> /Users/Shared/sss/chat/achat; exit; fi
	echo "$uname Joined the Chat @ $(date "+%H:%M:%S")" >> /Users/Shared/sss/chat/chat; 
	if [[ ! -d /Users/Shared/sss/chat/$uname ]]; then mkdir /Users/Shared/sss/chat/$uname; fi
	echo "" > /Users/Shared/sss/chat/$uname/chstub
	echo "0" > /Users/Shared/sss/chat/$uname/chexit
	echo "1" > /Users/Shared/sss/info/online/$uname
	echo "0" > /Users/Shared/sss/info/banned/$uname
	SAVEIFS=$IFS; IFS=$(echo -en "\n\b")
		while [[ $(cat /Users/Shared/sss/chat/$uname/chexit) = 0 ]]; do clear
			cat /Users/Shared/sss/chat/chat
			cat /Users/Shared/sss/chat/$uname/chstub;
			sleep 0.08
		done&
		while [[ $(cat /Users/Shared/sss/chat/$uname/chexit) = 0 ]]; do
			read -s -n 1 msg
			if [[ -n $msg ]]; thenq
				echo -n "$msg" >> /Users/Shared/sss/chat/$uname/chstub
			else
				reply=$(cat /Users/Shared/sss/chat/$uname/chstub | sed '1d')
				if [[ -n $(echo $reply | sed 's/[ ]//g') ]]; then
					if [[ $reply = "/leave" ]]; then
						echo "$uname disconnected @ $(date "+%H:%M:%S")" >> /Users/Shared/sss/chat/chat
						echo "0" > /Users/Shared/sss/info/online/$uname
						echo "1" > /Users/Shared/sss/chat/$uname/chexit
						exit
					elif [[ $reply = "/join" ]]; then
						echo "1" > /Users/Shared/sss/chat/$uname/chexit
					else
						echo "$uname: $reply" >> /Users/Shared/sss/chat/chat
						echo "$uname: $reply" >> /Users/Shared/sss/chat/achat
						#say -v alex "$reply"&
						echo "" > /Users/Shared/sss/chat/$uname/chstub
					fi
				fi
			fi
		done
	IFS=$SAVEIFS
	rsel=true
	until [[ $rmc = true ]]; do i=1
		for i in $(ls /Users/Shared/sss/); do
			echo $i
			if [[ -d "/Users/Shared/sss/$i" ]]; then
				if [[ $i = chat ]] || [[ $i = info ]]; then
					echo Nope
				elif [[ ! -f "/Users/Shared/sss/$i/p1/uname" ]] && [[ $rsel = true ]]; then
					player=1; room=$i; uname=$2; weapon=$3; xp=$4; rsel=false; rmc=true
					echo "$uname" > "/Users/Shared/sss/$room/p1/uname"
					echo "$xp" > "/Users/Shared/sss/$room/p1/xp"
					echo "$weapon" > "/Users/Shared/sss/$room/p1/weapon"
					bash "/Users/Shared/sss/$room/p1/client"
				elif [[ ! -f "/Users/Shared/sss/$i/p2/uname" ]] && [[ $rsel = true ]]; then
					player=2; room=$i; uname=$2; weapon=$3; xp=$4; rsel=false; rmc=true
					echo "$uname" > "/Users/Shared/sss/$room/p2/uname"
					echo "$xp" > "/Users/Shared/sss/$room/p2/xp"
					echo "$weapon" > "/Users/Shared/sss/$room/p2/weapon"
					bash "/Users/Shared/sss/$room/p2/client"
				fi
			fi
		done
		if [[ $rsel = true ]]; then
			makedirs room
		fi
	done
else
	function command { 
		if [[ $1 = room ]] || [[ $1 = rooms ]]; then
			echo "\|/ Open Rooms" >> /Users/Shared/sss/chat/achat
			for i in $(ls /Users/Shared/sss); do
				if [[ -d "/Users/Shared/sss/$i" ]]; then
					echo " | $i" >> /Users/Shared/sss/chat/achat
				fi
			done
			echo '/|\' >> /Users/Shared/sss/chat/achat
		elif [[ $1 = online ]] || [[ $1 = list ]]; then online=0
			for i in $(ls /Users/Shared/sss/); do
				if [[ -f "/Users/Shared/sss/$i/p1/uname" ]]; then
					cat "/Users/Shared/sss/$i/p1/uname" >> /Users/Shared/sss/chat/achat; ((online=$online+1))
				fi
				if [[ -f "/Users/Shared/sss/$i/p2/uname" ]]; then
					cat "/Users/Shared/sss/$i/p2/uname" >> /Users/Shared/sss/chat/achat; ((online=$online+1))
				fi
			done
			if [[ $online -gt 1 ]]; then
				echo "$online Players online" >> /Users/Shared/sss/chat/achat
			elif [[ $online = 1 ]]; then
				echo "$online Player online" >> /Users/Shared/sss/chat/achat
			elif [[ $online = 0 ]]; then
				echo "0 Players online" >> /Users/Shared/sss/chat/achat
			fi
		elif [[ $1 = stop ]]; then
			echo Stopping Server"..." >> /Users/Shared/sss/chat/achat
			for i in $(ls /Users/Shared/sss/); do
				if [[ -d "/Users/Shared/sss/$i" ]]; then
					rm -r "/Users/Shared/sss/$i"
				fi
			done
			echo "1" > /Users/Shared/sss/exit
		elif [[ $1 = help ]]; then
			echo "
[ ban <player> ] ban a player
[ unban <player> ] unban a player
[ help ] display this message
[ online ] display users online
[ room ] display all open rooms
[ say <msg> ] say something
[ stop ] stop the server" >> /Users/Shared/sss/chat/achat
		elif [[ $1 = clear ]]; then
			clear
		elif [[ $1 = "say"* ]]; then
			echo "Console:$(echo $1 | awk '{$1=""}1')" >> /Users/Shared/sss/chat/chat
			echo "Console:$(echo $1 | awk '{$1=""}1')" >> /Users/Shared/sss/chat/achat
		elif [[ $1 = "ban"* ]]; then
			echo "1" > /Users/Shared/sss/info/banned/$(echo $1 | awk '{$1=""}1' | sed 's/[ ]//g')
			echo "1" > /Users/Shared/sss/chat/$(echo $1 | awk '{$1=""}1' | sed 's/[ ]//g')/chexit
			echo "0" > /Users/Shared/sss/info/online/$(echo $1 | awk '{$1=""}1' | sed 's/[ ]//g')
		elif [[ $1 = "unban"* ]]; then
			echo "0" > /Users/Shared/sss/info/banned/$(echo $1 | awk '{$1=""}1' | sed 's/[ ]//g')
		else
			if [[ ! -z $1 ]]; then echo "Not a valid Command" >> /Users/Shared/sss/chat/achat; fi
		fi
	}
	function run {
		makedirs first; totalrooms2=1; msgtimer=0
		echo "Starting ShellSpace v$version server"
		echo "" > /Users/Shared/sss/chat/Admin/chstub
		if [[ ! -d /Users/Shared/sss/chat/Admin ]]; then mkdir /Users/Shared/sss/chat/Admin; fi
		while [[ $(cat /Users/Shared/sss/exit) = 0 ]]; do clear
			cat /Users/Shared/sss/chat/achat
			if [[ $msgtimer = 3000 ]]; then 
				echo -e "Auto: Type /join to join a game or /leave to disconnect" >> /Users/Shared/sss/chat/chat; msgtimer=0
			else
				((msgtimer=$msgtimer+1))
			fi
			echo -n ">>> $(cat /Users/Shared/sss/chat/Admin/chstub | sed '1d')"
			sleep 0.08
		done&
		SAVEIFS=$IFS; IFS=$(echo -en "\n\b")
		while [[ $(cat /Users/Shared/sss/exit) = 0 ]]; do
			read -s -n 1 cmd
			if [[ -n $cmd ]]; then
				echo -n "$cmd" >> /Users/Shared/sss/chat/Admin/chstub
			else reply=$(cat /Users/Shared/sss/chat/Admin/chstub | sed '1d')
			echo "" > /Users/Shared/sss/chat/Admin/chstub
			command "$reply"
			fi
		done
		IFS=$SAVEIFS
	}
	run
fi