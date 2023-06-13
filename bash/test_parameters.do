#!/bin/bash
_DEFAULT_ROWS_COUNT=20;
_DEFAULT_PAGE_NUMBER=1
_DEFAULT_AMOUNT=30000

while [ -n "$1" ]
do
case "$1" in
-amount) AMOUNT="$2"

# TODO: what does the "shift" mean?
shift;;

-rows) ROWS="$2"
shift ;;
-page) PAGE="$2"
shift;;
--) shift
break ;;
*) echo "$1 is not an option";;
esac
shift
done

if [ -z ${ROWS} ];then
    ROWS=$_DEFAULT_ROWS_COUNT
fi
if [ -z ${AMOUNT} ];then
    AMOUNT=$_DEFAULT_AMOUNT
fi
if [ -z ${PAGE} ];then
    PAGE=$_DEFAULT_PAGE_NUMBER
fi



#echo "The amount is: " + $AMOUNT;
#echo "The rows are: " + $ROWS;
#echo "The page is: " + $PAGE;


for (( i=1; i<=$PAGE; i++ ))
do
cat $(pwd)/bash/kzt_last_prices_buy.do | sed 's/<rows>/'"$ROWS"'/g; s/<page>/'"$i"'/g ;s/50000/'"$AMOUNT"'/g' | sh | jq -r '.data[] | [ .adv.price, .advertiser.nickName] | join(" ")'
done
