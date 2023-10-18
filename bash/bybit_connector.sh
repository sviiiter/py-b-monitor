jq '[.result.items[] | {name: .nickName, price: .price, available: 0, min: 0, max: 0}] | .[0:8]'
