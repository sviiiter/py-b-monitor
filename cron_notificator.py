from sqlalchemy import desc, asc

import create_migrations
from bot import bot
from config import telega_chat_id
from create_migrations import avg_price_table, connection, settings_table
from enums import CurrencyEnum


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


def should_notice(prices: list, sittings_currency: list) -> bool:
    return sittings_currency[1] <= abs(prices[1] - prices[0])


def transfer(prices: list, currency: int):
    bot.send_message(chat_id=telega_chat_id, text='{} -> {}'.format(prices[0], prices[1]))
    connection.execute(
        avg_price_table.delete().where(avg_price_table.columns.currency == currency)
    )

    connection.commit()


for i in [CurrencyEnum.KZT, CurrencyEnum.RUB]:
    settings = connection.execute(
        settings_table.select().where(settings_table.columns.currency == i)
    ).fetchone()

    data = extract_prev_current_prices(i)
    if should_notice(data, settings):
        transfer(data, i)
