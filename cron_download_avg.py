from enums import CurrencyEnum

if __name__ == '__main__':
    import config
    from binance_connector import execute_bash, avg_price
    from create_migrations import avg_price_table, connection

    price_name_list = execute_bash(config)
    avg = avg_price(price_name_list)

    query = avg_price_table.insert().values([
        {
            'rate': avg,
            'currency': CurrencyEnum.KZT
        }
    ])
    connection.execute(query)

    connection.commit()
