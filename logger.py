import logging.handlers
import sys

from config import app_env

formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s - %(context)s')

stdoutHandler = logging.StreamHandler(sys.stdout)
stdoutHandler.setLevel(logging.DEBUG)
stdoutHandler.setFormatter(formatter)

debugLogger = logging.getLogger("debug-logger")
debugLogger.setLevel(logging.DEBUG)

if app_env == 'debug':
    debugLogger.addHandler(stdoutHandler)


def debug(msg, context=None):
    if type(context) == list:
        context = [str(i) for i in context]

    debugLogger.debug(msg, extra={'context': context})
