import telebot
from telebot.types import Message

import bash_processor
from config import telega_token, telega_chat_id
from enums import PlatformEnum
from logger import debug

bot = telebot.TeleBot(telega_token, parse_mode='HTML')


@bot.message_handler(regexp='list*')
def welcome(container_message: Message):
    command = container_message.text.split('_')
    debug('The telegram bot chat ID is', container_message.chat.id)

    if len(command) < 3:
        raise IOError('Incorrect command')

    platform = PlatformEnum[command[1].upper()]
    fiat = command[2].upper()
    amount = command[3].upper() if len(command) >= 4 else False

    prices = bash_processor.execute_bash(
        bash_processor.get_curl_filename(platform.name.lower(), fiat),
        bash_processor.get_filter_filename(platform.name.lower()),
        amount
    )

    debug(prices)

    prices = ['{price} -- {name}, ${available}, ({min}-{max})'.format(**i)
              for i in prices]

    bot.send_message(chat_id=telega_chat_id, text='\n'.join(prices))


@bot.message_handler(commands=['idf'])
def chat_id(container_message: Message):
    bot.send_message(chat_id=container_message.chat.id, text=str(container_message.chat.id))
