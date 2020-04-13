#=====================================#
# coder par Said JOUETETE  	      #
# date : 15/04/2020		      #
# version : V0.1 Beta	              #
# but : simplifier le check de fusion #
#=====================================#

clear
echo -e "\e[0m hi Mr Said"
nbl=`cut -d "I" -f 4 test | wc -l`

i=1
while [ $i -le $nbl ]
do

ln=$i"p"
ddf=0

var1=`cut -d I -f 4 test | tr -d ' ' | sed -n "$ln" | tr ',' '.'`
var2=`cut -d I -f 5 test | tr -d ' ' | sed -n "$ln" | tr ',' '.'`

if [ "$var1" = "$var2" ];then
	cut -d "I" -f "2,3" test | sed -n "$ln" | tr -d "\n"
	echo -e "\e[32m $var1 | $var2 \e[0m" 
else	
	cut -d "I" -f 2,3 test | sed -n "$ln" | tr -d "\n" 
	echo -e "\e[31m $var1 | $var2 \e[0m \c"
	echo -e "\e[33m déséquilibre de : \c"
	echo -e $var1 $var2 | awk '{print $1-$2}'
	echo -e "\e[0m il faut la prender en charge"
fi
let i=i+1
done

if [ "$(date +"%s" -r test)" -le "$(date +"%s")" ];
then 
    pwd
fi

dsh=`ls -ltr test|tr -s " " |cut -d " " -f "8"`
timenow=$date +"%H:%M:%S" 2>/dev/null
shmbeg=$date -d '15:00:00' 2>/dev/null
shmend=$date -d '23:59:59' 2>/dev/null

echo $timenow


if [ $timenow -gt $shmbeg ] && [ $timenow -lt $shmend ] ;
then
    echo "shit apt midi"
    echo $dsh
fi
