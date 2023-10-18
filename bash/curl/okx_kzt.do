_DEFAULT_AMOUNT=5000

while [ -n "$1" ]
do
case "$1" in
-h)

    Help
    exit
    shift;;

-amount)
    AMOUNT="$2"
    shift;;

--)
    shift
    break ;;

*)
    echo "$1 is not an option";;

esac
shift
done

if [ -z ${AMOUNT} ];then
    AMOUNT=$_DEFAULT_AMOUNT
fi

curl -s "https://www.okx.com/v3/c2c/tradingOrders/books?t=1694959378635&quoteCurrency=kzt&baseCurrency=usdt&side=sell&paymentMethod=Kaspi+Bank&userType=all&showTrade=false&showFollow=false&showAlreadyTraded=false&isAbleFilter=false&hideOverseasVerificationAds=false&quoteMinAmountPerOrder=$AMOUNT&sortType=price_asc" \
  -H 'authority: www.okx.com' \
  -H 'accept: application/json' \
  -H 'accept-language: ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7,sr;q=0.6' \
  -H 'app-type: web' \
  -H 'authorization: eyJhbGciOiJIUzUxMiJ9.eyJqdGkiOiJleDExMDE2OTM5MzA1Mzg1NjVGMTMwOUZFRDQ3QkU2RUVCMUF1cW4iLCJ1aWQiOiJoSlBZUHp6dENwbUZhcTd6Tzhxb2JBPT0iLCJzdGEiOjAsIm1pZCI6ImhKUFlQenp0Q3BtRmFxN3pPOHFvYkE9PSIsImlhdCI6MTY5NDk1OTM0MCwiZXhwIjoxNjk1NTY0MTQwLCJiaWQiOjAsImRvbSI6Ind3dy5va3guY29tIiwiZWlkIjoxLCJpc3MiOiJva2NvaW4iLCJkaWQiOiJHU0pGc0oyNVJiUldEUGJkVDcyTGRicS8rU3JaaUpzcWc4ZWNiVFEyWFpkV00wWlJLNC9jVzVVdnNNRUYvQXFQIiwibGlkIjoiaEpQWVB6enRDcG1GYXE3ek84cW9iQT09Iiwic3ViIjoiQ0IyNTU1ODQ5NTUwN0I4MDhCNkRCNEM4N0E3MDI1QjMifQ.Kj_4dZOAop5PWO6tYHI481HwDgCNrGquIVPL4lEscA8Ldz2gL8E2dEdbJHKzlMpULVCwJG5imKIC7nRnjmOC3w' \
  -H 'cache-control: no-cache' \
  -H 'cookie: locale=ru_RU; preferLocale=ru_RU; ok_prefer_udColor=0; browserVersionLevel=v5.8e6ec7b1e6dc; devId=9e9e313c-69ae-4fc4-b8e7-0c85e8023f46; first_ref=https%3A%2F%2Fwww.google.com%2F; intercom-id-ny9cf50h=28e4265e-a609-4908-bc2a-77cf13c63329; intercom-device-id-ny9cf50h=812d5e58-bef0-48eb-9f8a-db0ed64c2e3b; _ym_uid=1693920224436533608; _ym_d=1693920224; connectedWallet=0; _rdt_uuid=1693920413654.19359f4a-ec16-4c44-a183-c559827bd287; u_pid=D6D6lm9rEC5jB70; finger_test_cookie=1693930463402; tmx_session_id=sqqp5ekrg4o1693930463542; isLogin=1; ftID=521051536588384.1104feb8145d799e065cad8e81b016b609382.1010L2o0.4CFC860819E24D79; x-lid=66cc6fa42d017f19ec1707b489b664aaa8a23c234746c0d03ceba84cb674764d161cf10b; ok_prefer_udTimeZone=1; _gid=GA1.2.190286973.1694906386; _ym_isad=2; __cf_bm=uEhYrsq6.KWy9y5lPh9M1RzQ2b7pg.rtMcHoQ5TAgTY-1694959340-0-Ace+TGMQQalzZG3C+wzNhLsTu/S13UEaJtrZmDHwI7CGqucJd5IK0YYmld78wEKuTw8pJd+PQSm1IGvgQg+qkLw=; ok_prefer_currency={%22currencyId%22:2%2C%22displayName%22:%22RUB%22%2C%22isDefault%22:0%2C%22isoCode%22:%22RUB%22%2C%22precision%22:1%2C%22symbol%22:%22%E2%82%BD%22%2C%22usdToThisRate%22:96.887}; token=eyJhbGciOiJIUzUxMiJ9.eyJqdGkiOiJleDExMDE2OTM5MzA1Mzg1NjVGMTMwOUZFRDQ3QkU2RUVCMUF1cW4iLCJ1aWQiOiJoSlBZUHp6dENwbUZhcTd6Tzhxb2JBPT0iLCJzdGEiOjAsIm1pZCI6ImhKUFlQenp0Q3BtRmFxN3pPOHFvYkE9PSIsImlhdCI6MTY5NDk1OTM0MCwiZXhwIjoxNjk1NTY0MTQwLCJiaWQiOjAsImRvbSI6Ind3dy5va3guY29tIiwiZWlkIjoxLCJpc3MiOiJva2NvaW4iLCJkaWQiOiJHU0pGc0oyNVJiUldEUGJkVDcyTGRicS8rU3JaaUpzcWc4ZWNiVFEyWFpkV00wWlJLNC9jVzVVdnNNRUYvQXFQIiwibGlkIjoiaEpQWVB6enRDcG1GYXE3ek84cW9iQT09Iiwic3ViIjoiQ0IyNTU1ODQ5NTUwN0I4MDhCNkRCNEM4N0E3MDI1QjMifQ.Kj_4dZOAop5PWO6tYHI481HwDgCNrGquIVPL4lEscA8Ldz2gL8E2dEdbJHKzlMpULVCwJG5imKIC7nRnjmOC3w; _gat_UA-35324627-3=1; _ga_G0EKWWQGTZ=GS1.1.1694959341.38.0.1694959341.60.0.0; _ga=GA1.1.44006868.1693920219; ok-ses-id=b0/RvM4LqdFhWFwXo8mKfS6tMj2RsdLXf22xI/gKQTOvnlUAz5iIOp3KsD7wu5kD8Om/G1051pe+rDxB6sAoDgcIexxWuw3pl3eRCRQXBKCPdbA9AVR37F1bNuwK8HHE; _ym_visorc=b; okg.currentMedia=sm; _monitor_extras={"deviceId":"iJomnpfkSIi5twoo3VU1qD","eventId":1408,"sequenceNumber":1408}; amp_56bf9d=3qv9xVA0szDs2aO5jga92n.dm1OWDN1Ym5xSUVJVUlzMTVpbERBZz09..1hahn63o6.1hahn6s3f.ka.2j.mt; intercom-session-ny9cf50h=K1JjMkh1Smd5bHRTM0pFMDMzdFMvLzdUbmpMam5GVHBFaVFRWXlDTXFQakZ6ajEyenlLbWtlbzZ2QXNHWW40eS0tajRoOTlWdDhVR05lMEFibFloSUlCZz09--a2c282547a7c6f09c5cf92786315759b4f872306' \
  -H 'devid: 9e9e313c-69ae-4fc4-b8e7-0c85e8023f46' \
  -H 'pragma: no-cache' \
  -H 'referer: https://www.okx.com/ru/p2p-markets/kzt/buy-usdt' \
  -H 'sec-ch-ua: "Chromium";v="116", "Not)A;Brand";v="24", "Google Chrome";v="116"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36' \
  -H 'x-cdn: https://static.okx.com' \
  -H 'x-locale: ru_RU' \
  -H 'x-utc: 2' \
  -H 'x-zkdex-env: 0' \
  --compressed
