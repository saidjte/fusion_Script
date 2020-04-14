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

if [ "$var1" == "$var2" ];then
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


dsh=`ls -ltr test|tr -s " " | cut -d " " -f "8" | cut -d ":" -f "1"`
dfw=`ls -ltr test|tr -s " " | cut -d " " -f "7"`
echo $dfw


# verification du temps d'exécution de script
H=$(date +%H)
D=$(date +%d/%m/%y)

echo $D

if (( 15 <= 10#$H && 10#$H <= 23 )); then
# verification du temps d'écriture de fichier
	echo SHIFT Apres Midi
	
	if (( 15 <= $dsh && $dsh <= 23 )) && ((10#$H == $dfw)) ; then
		echo "yes"
	else
		echo "non"
	fi


elif (( 00 <= 10#$H && 10#$H < 07 )); then

	echo SHIFT Nuit

else
        
	echo Shift Matin

	if (( 07 <= $dsh && $dsh < 15 )) && ((10#$D == "14/04/2020")) ; then
               echo "yes"

	       j=`date +"%Y/%m/%d"`
	        j=$(($j - 1))
		 echo $j


        else
               echo "non"
        fi


fi


