#!/bin/bash
mode=$1; if [[ -z $mode ]]; then mode=text; fi
function chatdatabase_ {
	d_verbs=('fuck ' 'suck ' 'stick ' 'blow ' 'taste ')
	d_f_nouns=('pussy ' 'vagina ' 'mouth ' 'tounge ' 'ass ')
	d_m_nouns=('cock ' 'dick ' 'mouth ' 'tounge ')
	d_adjectives=('hairy ' 'large ' 'BIG ' 'slippery ' 'warm ')
	q_verbs1=('Do you ' 'You ')
	q_verbs=('like that ' 'feel that ' 'smell that ')
	q_end=('you whore? ' 'you bitch? ')
	e_complete=('YES YES YES YES YES ' 'FUCK FUCK FUCK FUCK FUCK ' 'SO DEEP ')
	endings=('YES IM CUMMING ' 'IM CUMMING')
	endings2=('DRINK MY CUM ' 'YESS ')
	types=('exclamation' 'question' 'statement')
	chatlog=" "
	malevoices=('Alex' 'Fred' 'Bruce'); femalevoices=('Kathy' 'Vicki' 'Victoria')
	mvoice=${malevoices[$((RANDOM%3))]}; fvoice=${femalevoices[$((RANDOM%3))]}
	randomcount=$((RANDOM%10+5))
	count=0
}
function randomize_ {
	d_verb=${d_verbs[$((RANDOM%5))]}
	d_f_noun=${d_f_nouns[$((RANDOM%5))]}
	d_m_noun=${d_m_nouns[$((RANDOM%4))]}
	d_adjective=${d_adjectives[$((RANDOM%5))]}
	q_verb1=${q_verbs1[$((RANDOM%2))]}
	q_verb=${q_verbs[$((RANDOM%3))]}
	q_endd=${q_end[$((RANDOM%2))]}
	e_completee=${e_complete[$((RANDOM%3))]}
	end1=${endings[$((RANDOM%2))]}
	end2=${endings2[$((RANDOM%2))]}
}
function checkfor_ {
	if [[ -n $(echo $chatlog | grep "$message") ]]; then
		passed=false
	else
		passed=true
		chatlog=$(echo -n "$message \n$chatlog")
	fi
	if [[ $passed = false ]]; then
		if [[ $((RANDOM%5)) = 4 ]]; then
			passed=true
		fi
	fi
}
function female_ {
	randomize_
	passed=false; while [[ $passed = false ]]; do
		if [[ $1 = exclamation ]]; then
			message=$(echo "$e_completee"); check=false; passed=true
		elif [[ $1 = question ]]; then
			message=$(echo "$q_verb1$q_verb$q_endd"); check=true
		elif [[ $1 = statement ]]; then
			message=$(echo "$d_verb"my "$d_f_noun"with your "$d_adjective$d_m_noun"); check=true
		fi
		if [[ $check = true ]]; then
			checkfor_
		fi
	done
	echo "$fvoice: $message"
	if [[ $mode = voice ]]; then
		say -v "$fvoice" "$message"
	fi
}
function male_ {
	randomize_
	passed=false; while [[ $passed = false ]]; do
		if [[ $1 = exclamation ]]; then
			message=$(echo "$e_completee"); check=false; passed=true
		elif [[ $1 = question ]]; then
			message=$(echo "$q_verb1$q_verb$q_endd"); check=true
		elif [[ $1 = statement ]]; then
			message=$(echo "$d_verb"my "$d_m_noun"with your "$d_adjective$d_f_noun"); check=true
		fi
		if [[ $check = true ]]; then
			checkfor_
		fi
	done
	echo "$mvoice: $message"
	if [[ $mode = voice ]]; then
		say -v "$mvoice" "$message"
	fi
}
function climax_ {
	randomize_
	if [[ $((RANDOM%2)) = 1 ]]; then
		message="$end1. $end2"; voice=$mvoice
	else
		message="$end1. $end2"; voice=$fvoice
	fi
	echo "$voice: $message"
	if [[ $mode = voice ]]; then
		say -v $voice $message
	fi
}
function turnup_ {
	#fold
	osascript -e "set volume 10"
}
chatdatabase_
while [[ $count -lt $randomcount ]]; do
	female_ ${types[$((RANDOM%3))]}
	male_ ${types[$((RANDOM%3))]}
	((count=$count+1)); 
done
climax_