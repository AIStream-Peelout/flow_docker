import sys
import json
import os
from typing import List, Dict
from flood_forecast.trainer import train_function
import requests
from typing import List

class DynamicAccessNestedDict:
    """Dynamically get/set nested dictionary keys of 'data' dict"""

    def __init__(self, data: dict):
        self.data = data

    def getval(self, keys: List):
        data = self.data
        for k in keys:
            data = data[k]
        return data

    def setval(self, keys: List, val) -> None:
        data = self.data
        lastkey = keys[-1]
        for k in keys[:-1]:  # when assigning drill down to *second* last key
            if k not in data:
                data[k] = {}
            data = data[k]
        data[lastkey] = val


def convert_args(args_shit: List):
    wandb_config = {}
    for i in range(1, len(args_shit)):
        print(args_shit)
        split_shit = args_shit[i].split("=")
        key = split_shit[0].replace("--", "")
        wandb_config[key] = split_shit[1]
    return wandb_config


def make_config(wandb_config: Dict, base_config_path: str):
    with open(base_config_path) as f:
        data = DynamicAccessNestedDict(json.load(f))
    for key, value in wandb_config.items():
        if "." in key:
            path = key.split(".")
            data.setval(path, value)
        else:
            data.data[key] = value
    return data.data


def main():
    result_wandb = convert_args(sys.argv)
    with open("config.json", "w+") as f:
        r = requests.get(os.environ["BASE_CONFIG_PATH"])
        f.write(r.text)
    the_config = make_config(result_wandb, "config.json")
    print(the_config)
    train_function("PyTorch", the_config)

if __name__ == "__main__":
    main()
