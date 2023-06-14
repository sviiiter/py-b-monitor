from sqlalchemy import desc, asc

import create_migrations
from bot import bot
from config import telega_chat_id
from create_migrations import avg_price_table, connection, settings_table
from enums import CurrencyEnum

settings = connection.execute(settings_table.select()).fetchone()


def extract_prev_current_prices(currency: CurrencyEnum) -> list:
    query = create_migrations.db.select(avg_price_table).limit(20) \
        .where(avg_price_table.columns.currency == currency.value)
    rs_first = connection.execute(query.order_by(asc(avg_price_table.columns.date)))
    rs_last = connection.execute(query.order_by(desc(avg_price_table.columns.date)))

    first = rs_first.fetchone()
    last = rs_last.fetchone()

    return [
        first[1] if first else 0,
        last[1] if last else 0
    ]


def should_notice(prices: list) -> bool:
    return settings[1] <= abs(prices[1] - prices[0])


data = extract_prev_current_prices(CurrencyEnum.KZT)

if should_notice(data):
    bot.send_message(chat_id=telega_chat_id, text='{} -> {}'.format(data[0], data[1]))
    connection.execute(
        create_migrations.avg_price_table.delete().where(avg_price_table.columns.currency == CurrencyEnum.KZT)
    )

    connection.commit()
