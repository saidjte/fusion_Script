
nbl=`cut -d "I" -f 4 test | wc -l`

i=1
while [ $i -le $nbl ]
do

ln=$i"p"

var1=`cut -d I -f 4 test | tr -d ' ' | sed -n "$ln"`                                                var2=`cut -d I -f 5 test | tr -d ' ' | sed -n "$ln"`

if [ "$var1" = "$var2" ];then                             echo -e "\e[32m $var1 | $var2 \e[0m" 
else                                                      echo -e "\e[31m $var1 | $var2 \e[0m"
	echo -e $var1 $var2 | awk '{print  $1 - $2}'
fi
let i=i+1
done
