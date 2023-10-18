jq '[.data.sell[] | {name: .nickName, price: .price, available: .availableAmount, min: .quoteMinAmountPerOrder, max: .quoteMaxAmountPerOrder}] | .[0:8]'
