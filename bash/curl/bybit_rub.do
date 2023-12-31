_DEFAULT_AMOUNT=16000

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

curl -s 'https://api2.bybit.com/fiat/otc/item/online' \
  -H 'authority: api2.bybit.com' \
  -H 'accept: application/json' \
  -H 'accept-language: ru-RU' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json;charset=UTF-8' \
  -H 'cookie: deviceId=dd9f40c7-80d0-fab8-5aad-7d3b5262e845; _by_l_g_d=ed5bb96d-c9bb-2b17-8d3c-e33a8eb37833; _gcl_aw=GCL.1693060760.CjwKCAjwxaanBhBQEiwA84TVXN6H3wgr8ME7fkp3bsWi5N1MnEyRuSlO3xmZ1y-ZUUg4sT_owEGIcRoC020QAvD_BwE; _gcl_au=1.1.207984158.1693060760; _fbp=fb.1.1693060760711.883949237; _ym_uid=1693060761115304237; _ym_d=1693060761; BYBIT_REG_REF={"lang":"ru-RU","g":"ed5bb96d-c9bb-2b17-8d3c-e33a8eb37833","referrer":"www.bybit.com/en-US/task-center/task_detail/?task-id=1214","source":"bybit.com","medium":"other","url":"https://www.bybit.com/fiat/deposit"}; sensorsdata2015session=%7B%7D; _ga=GA1.1.1394055997.1693060761; 35CJa4376-ref=organic|search|google|google.com|1693312899407; _tt_enable_cookie=1; _ttp=D4tLhiepD6-aMAuNbspv0Tp4HQ1; permutive-id=848c9923-bd7f-4c72-8c1c-7fc4a98dbe9c; _ga_LEBL6PF94W=GS1.1.1693312899.1.1.1693313538.0.0.0; BYBIT_REG_REF_prod={"lang":"ru-RU","g":"ed5bb96d-c9bb-2b17-8d3c-e33a8eb37833","referrer":"www.bybit.com/register?affiliate_id=50785&group_id=0&group_type=1&gclid=Cj0KCQjwgNanBhDUARIsAAeIcAswJPjfvrlNLVj9YyV1U8I9gkn9UPmA41_0qtigezlIU2aIkD7WNZ0aAsonEALw_wcB","source":"bybit.com","medium":"affiliate","affiliate_id":"50785","group_id":"0","group_type":"1","url":"https://www.bybit.com/ru-RU/sign-up?affiliate_id=50785&group_id=0&group_type=1&gclid=Cj0KCQjwgNanBhDUARIsAAeIcAswJPjfvrlNLVj9YyV1U8I9gkn9UPmA41_0qtigezlIU2aIkD7WNZ0aAsonEALw_wcB"}; sensorsdata2015jssdkcross=%7B%22distinct_id%22%3A%22100662479%22%2C%22first_id%22%3A%2218a3248f2765fa-0d1be1f0b06d008-1b525634-1296000-18a3248f277329%22%2C%22props%22%3A%7B%22_a_u_v%22%3A%220.0.5%22%2C%22%24latest_traffic_source_type%22%3A%22%E7%9B%B4%E6%8E%A5%E6%B5%81%E9%87%8F%22%2C%22%24latest_search_keyword%22%3A%22%E6%9C%AA%E5%8F%96%E5%88%B0%E5%80%BC_%E7%9B%B4%E6%8E%A5%E6%89%93%E5%BC%80%22%2C%22%24latest_referrer%22%3A%22%22%2C%22%24latest_utm_source%22%3A%22push%22%2C%22%24latest_utm_medium%22%3A%22organic_content%22%2C%22sa_utm_channel%22%3A%22mkt_%22%2C%22sa_utm_ci%22%3A%2265%22%2C%22sa_utm_tcn%22%3A%2216879409270802401%22%2C%22utm_source%22%3A%22push%22%2C%22utm_medium%22%3A%22organic_content%22%7D%2C%22identities%22%3A%22eyIkaWRlbnRpdHlfY29va2llX2lkIjoiMThhMzI0OGYyNzY1ZmEtMGQxYmUxZjBiMDZkMDA4LTFiNTI1NjM0LTEyOTYwMDAtMThhMzI0OGYyNzczMjkiLCIkaWRlbnRpdHlfbG9naW5faWQiOiIxMDA2NjI0NzkifQ%3D%3D%22%2C%22history_login_id%22%3A%7B%22name%22%3A%22%24identity_login_id%22%2C%22value%22%3A%22100662479%22%7D%2C%22%24device_id%22%3A%2218a3248f2765fa-0d1be1f0b06d008-1b525634-1296000-18a3248f277329%22%7D; _abck=A0FCB6B79D455C2813F8EA695A95774B~0~YAAQXxdlX0hnfpSKAQAA7De1pwob7DUMgl94q1utvuLbu5hWYg6nznOLQkF0hedgH30qq1FrRp+GUCli/gV6hmMKUe+BGEwYSNMx2/heko3Mdlv/jooP1qwmJ2ZQjhAfAOf2Oif5NcwDEFPzaokh83iioFHGDsWopX6zcWJKUi4/f8cTDmEHF+Ja837mxcMcbplqTcrtK8pUwXpKf4zNNjIhNrzRIjGxcb7u6fXV2lg/ebRk0Q0sZancV1noXNurJP5ue7hPiYU6T+h0DnMR0QApPh2tHl2w3m2b7vBl/Heo094HYwC5SoT6l/AVx2SXvtSrpOHRAEvt80KqmHLyy3dd7DgldoZlOQvYWQDryPDMuV/BZJc1uTn/SkXyMjWROMovZ7ZM49FSIguCOtUKMOudXOu768c=~-1~-1~-1; bm_sz=EB1249E40342DD2CD7B956C41C6C31DD~YAAQXxdlX0tnfpSKAQAA7De1pxXIBeomAUcyPedcmsZ8fGMm4QgNT3cbPoFx5WfNj/vDxFE/tYIhDd6NM/RYw0B00/FbOsYuOcgY6ZyZTHUHkyO3I0srnpXMpF5u6ZS/n+leno8uhaAM1zUanCOuhr9Az+ZPse2t+3ENrDVPzU5I0iaTewcZaUpYgKS3SbeRC9XsaOhmCvfjv+IBPIBmzPEUbpz9WfNsHX52AYlV9wR01O2kczlJzYAXygPxBQgogjDNJA5LnY9NiPA1sSbKeEOr2zUR6GiBGLloUBkb4UrLKA==~4535347~4469044; ak_bmsc=47F756ED863958676D6F38CFD1D367B4~000000000000000000000000000000~YAAQXxdlXzNpfpSKAQAA/j+1pxXB9sFcuqUaXRkNnPnd3gnUrT30QzP7vWdF6Fg4E0ntC8q8aQ9b2Qp44SdgKJycfpr3salzC4Bg9HmOXwcIRjMR30v2mhz/SX0zuJyo58dHOeteWxF1nxHA0Qo8UN3ulho//aTLwA1skLZzA+lnDPZQ14jBCqyCoPyX6/Qd7LDOm83aEMyiv/bDgbJyY8ZhXuU7tY3dKj3RW0yBK/fJb8Oqz86eXBtCnwWRsCutiTExkBjiaxDdTkKevPcM1+UIWBI00yqF4STlwzCM41mLl4ZYhzTPWDva9o5wwNm/l1Bu3aefij7YRiifwfG+uyRlIEykvqGRKWQLlJvu2+lX7nSoI4lBSX8sepmGD4NwKnXB6fZBKUIROKg+Do4cjECt4W21CCctYhThJdER53xQkQKXb3usis0zGFBR04p2Y82ResJa4eldU1BXh/i7XfWnDmXUa4YDU/WBNHYAPMNKc6dedsoMf5qtKWgsd34=; _ym_isad=2; detection_time=1695081600000; secure-token=eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2OTUyOTAxNTIsInVzZXJfaWQiOjEwMDY2MjQ3OSwibm9uY2UiOiI3YTgyMjQ0YyIsImdlbl90cyI6MTY5NTAzMDk1MiwicCI6MywiZXh0Ijp7Im1jdCI6IjE2OTMwNjQyMjciLCJzaWQiOiIifX0.gsTanWYF3a8A5ood99UjKss25uofUczTYSdp58YY-28xI2P41pNlRmsMjvWSVDjDxcCGrVng4dkGLR07KxX-uQ; b_t_c_k=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2OTUyOTAxNTIsInVzZXJfaWQiOjEwMDY2MjQ3OSwibm9uY2UiOiI3YTgyMjQ0YyIsImdlbl90cyI6MTY5NTAzMDk1MiwicCI6MywiZXh0Ijp7Im1jdCI6IjE2OTMwNjQyMjciLCJzaWQiOiIifX0.bDWM6sivaLKeZ4QCnu0u4fFv3iqOpwOw-DmsRfojCCw; _ga_SPS4ND2MGC=GS1.1.1695030788.37.1.1695031267.44.0.0; bm_sv=49F6352A76742E20AA84F3411C58C3E5~YAAQXxdlXx+NgJSKAQAAt6O8pxXiqkqBK8ZazYhH9QK2IwThGegiq1NRL/1coKyVLJtixl9eT4GL+KF2y+qOQ5TYu12bJsdH7DgIBZEtU1itwvOKvHe7QrFEKS7bYa0Ym3i/BG2jhHI4V5xkpuPd9hcWjOwXuMq/u+ZgAAJS3NDVcZvjvQVmhvv9oDjQlFRa2CZ0p4fDhhkmow2AA1YdM62fsIOqSxVuDIH7g8nZUdY7BttweJFx841OyQyMfq1AJg==~1' \
  -H 'guid: ed5bb96d-c9bb-2b17-8d3c-e33a8eb37833' \
  -H 'lang: ru-RU' \
  -H 'origin: https://www.bybit.com' \
  -H 'platform: PC' \
  -H 'pragma: no-cache' \
  -H 'referer: https://www.bybit.com/' \
  -H 'risktoken: v2:gRoG1GvoQYwJwTN75u15d4RNTwwjCxRxRVbCchKXS3O94hWVZSWqRyg/WBxZug40WovgSCSBw1GvI6eU/mmTmemi93KH5bZfyJmyqyNnPU1mHMYamQ86qctCchm56gWpAfY/PIVMZmYys3i7T+BNfSiadIN1e7lNxUvxllXP4JwWeVOr+oeHsmnlUES1lXtFUiUWGm5SsZBpYLyLqBQtQQlyYNLG6RQ9Mge94/5iWF6tHSs=' \
  -H 'sec-ch-ua: "Chromium";v="116", "Not)A;Brand";v="24", "Google Chrome";v="116"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-site' \
  -H 'traceparent: 00-b780f7804e62f9415780b9dac1712368-48d1aa6c63518192-00' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36' \
  -H 'usertoken: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2OTUyOTAxNTIsInVzZXJfaWQiOjEwMDY2MjQ3OSwibm9uY2UiOiI3YTgyMjQ0YyIsImdlbl90cyI6MTY5NTAzMDk1MiwicCI6MywiZXh0Ijp7Im1jdCI6IjE2OTMwNjQyMjciLCJzaWQiOiIifX0.bDWM6sivaLKeZ4QCnu0u4fFv3iqOpwOw-DmsRfojCCw' \
  --data-raw '{"userId":100662479,"tokenId":"USDT","currencyId":"RUB","payment":["75","1","379","585","581","582","377"],"side":"0","size":"10","page":"1","amount":"'$AMOUNT'","authMaker":false,"canTrade":false}' \
  --compressed
