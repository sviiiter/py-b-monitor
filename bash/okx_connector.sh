jq '[.data.sell[] | {name: .nickName, price: .price}] | .[0:5]'
