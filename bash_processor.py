import json
import subprocess

from config import app_path


def execute_bash(curl_file: str, pipe_filters_file: str, amount=False) -> list[dict]:

    part_amount_str: str = '-amount {}'.format(amount) if amount is not False else ''

    con_str = "cat {} | sh -s -- {} | {}".format(
        curl_file,
        part_amount_str,
        pipe_filters_file
    )

    return json.loads(subprocess.check_output(con_str, shell=True).decode('utf-8'))


def avg_price(prices_names: list) -> float:
    prices = list(filter(None, [r[0] for r in prices_names]))
    prices = [float(i) for i in prices]
    prices = prices[1:7]
    return round(sum(prices) / len(prices), 2)


def get_curl_filename(platform_name: str, fiat: str) -> str:
    return f'{app_path}bash/curl/{platform_name}_{fiat.lower()}.do'


def get_filter_filename(platform_name: str) -> str:
    return f'{app_path}bash/{platform_name}_connector.sh'
