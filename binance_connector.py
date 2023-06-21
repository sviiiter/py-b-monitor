import subprocess


def execute_bash(cmd_items) -> list:
    con_str = "{} -rows {} -page {} -amount {} -fiat {}".format(
        cmd_items.bash_script_abs_file_name,
        cmd_items.bash_script_param_rows,
        cmd_items.bash_script_param_page,
        cmd_items.bash_script_param_amount,
        cmd_items.bash_script_param_fiat
    )

    rc = subprocess.check_output(con_str, shell=True).decode('utf-8')

    return [i.split(' ') for i in rc.split('\n')]


def avg_price(prices_names: list) -> float:
    prices = list(filter(None, [r[0] for r in prices_names]))
    prices = [float(i) for i in prices]
    prices = prices[1:7]
    return round(sum(prices) / len(prices), 2)
