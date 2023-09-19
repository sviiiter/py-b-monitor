from enums import CurrencyEnum

if __name__ == '__main__':
    import config
    from bash import execute_bash, avg_price
    from create_migrations import avg_price_table, connection

    curr_amount = {
        CurrencyEnum.KZT: 30000,
        CurrencyEnum.RUB: 15000
    }

    for currency in curr_amount:
        config.bash_script_param_amount = curr_amount[currency]
        config.bash_script_param_fiat = currency.name

        price_name_list = execute_bash(config)
        avg = avg_price(price_name_list)

        query = avg_price_table.insert().values([
            {
                'rate': avg,
                'currency': currency
            }
        ])

        connection.execute(query)

    connection.commit()
