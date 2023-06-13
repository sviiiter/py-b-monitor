import telebot
from telebot.types import Message

import binance_connector
import config
from config import telega_token, telega_chat_id
from logger import debug

bot = telebot.TeleBot(telega_token, parse_mode='HTML')


@bot.message_handler(regexp='list*')
def welcome(container_message: Message):
    command = container_message.text.split('_')
    debug('The telegram bot chat ID is', container_message.chat.id)

    config.bash_script_param_rows = 20
    if len(command) == 2 and command[1].isnumeric():
        config.bash_script_param_amount = int(command[1])

    prices = binance_connector.execute_bash(config)

    prices = [' -- '.join(i) for i in prices]

    bot.send_message(chat_id=telega_chat_id, text='\n'.join(prices))


@bot.message_handler(commands=['idf'])
def chat_id(container_message: Message):
    bot.send_message(chat_id=container_message.chat.id, text=str(container_message.chat.id))
