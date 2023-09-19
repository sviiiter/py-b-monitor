jq '[.result.items[] | {name: .nickName, price: .price}] | .[0:5]'
