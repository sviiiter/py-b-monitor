import datetime

import sqlalchemy as db

import config
from enums import CurrencyEnum

print('sqlite:///{}'.format(config.db_name))
engine = db.create_engine('sqlite://{}'.format(config.db_name))
connection = engine.connect()

metadata = db.MetaData()

# @TODO: Next time do database querying by "sqlalchemy models"
avg_price_table = db.Table('avg_price', metadata,
                           db.Column('id', db.Integer, primary_key=True, autoincrement=True),
                           db.Column('rate', db.Float),
                           db.Column('date', db.types.DateTime(timezone=True), default=datetime.datetime.utcnow()),
                           db.Column('currency', db.Integer)
                           )

settings_table = db.Table('settings', metadata,
                          db.Column('id', db.Integer, primary_key=True, autoincrement=True),
                          db.Column('delta_amount', db.Float),
                          db.Column('currency', db.Integer)
                          )

if __name__ == '__main__':
    metadata.create_all(engine)
    default_value_query = settings_table.insert().values([
        {'delta_amount': 1, 'currency': CurrencyEnum.KZT.value}
    ])
    rs = connection.execute(default_value_query)
    connection.commit()
