#!/bin/bash

Help()
{
   # Display Help
   echo "Add description of the script functions here."
   echo
   echo "Syntax: script_name [-amount|rows|page|conn|fiat|a|h]"
   echo "options:"
   echo "  -amount     Pivoting amount"
   echo "  -rows       The rows count"
   echo "  -page       Page to download"
   echo "  -conn       The curl file"
   echo "  -fiat       KZT|RUB"
   echo "  -a          The trade type: buy|sell"
   echo "  -h          Print this Help."
   echo
}


# TODO: excess
if [ -z "$APP_PATH" ];then
    APP_PATH='/app/'
fi

_DEFAULT_ROWS_COUNT=20
_DEFAULT_PAGE_NUMBER=1
_DEFAULT_AMOUNT=30000
_FIAT=KZT

_ACTION_BUY="BUY"
_ACTION_SELL="SELL"

_PAY_TYPES_KZT="[\"KaspiBank\"]"
_PAY_TYPES_RUB="[\"RosBankNew\"]"

_DEFAULT_CURL_FILE=$APP_PATH"bash/last_prices.do"

while [ -n "$1" ]
do
case "$1" in

-a)
    ACTION="$2"
    shift ;;

-fiat)
    FIAT="$2"
    shift ;;

-h)

    Help
    exit
    shift;;

-amount)
    AMOUNT="$2"

# TODO: what does the "shift" mean?

    shift;;

-rows)
    ROWS="$2"
    shift ;;

-page)
    PAGE="$2"
    shift;;

-conn)
    CURL_FILE="$2"
    shift;;

--)
    shift
    break ;;

*)
    echo "$1 is not an option";;

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
if [ -z ${FIAT} ];then
    FIAT=$_FIAT
fi

if [ "$FIAT" == "KZT" ];then
    ACTION=$_ACTION_BUY
    PAY_TYPES=$_PAY_TYPES_KZT
else
    ACTION=$_ACTION_SELL
    PAY_TYPES=$_PAY_TYPES_RUB
fi


if [ -z ${CURL_FILE} ];then
    CURL_FILE=$_DEFAULT_CURL_FILE
fi



for (( i=1; i<=$PAGE; i++ ))
do

SED='s/<rows>/'"$ROWS"'/g;'\
's/<page>/'"$i"'/g;'\
's/<amount>/'"$AMOUNT"'/g;'\
's/<fiat>/'"$FIAT"'/g;'\
's/<action>/'"$ACTION"'/g;'\
's/<pay_types>/'"$PAY_TYPES"'/g;'

cat $CURL_FILE | sed $SED | sh | jq -r '.data[] | [ .adv.price, .advertiser.nickName] | join(" ")'
done


