import json
import os

default_file_path = "projects/python/to-do-list-manager/data/to_do_tasks.json"

def write_tasks(task, file_path = None):
    try:
        # check if main is passing file path, if yes overwrite default path
        if file_path:
            default_file_path = file_path

        os.makedirs(os.path.dirname(default_file_path), exist_ok = True)
        with open(default_file_path, "w") as jfile:
            json.dump(json_data, jfile, indent = 4)
    except Exception as e:
        print("Error wjile saving tasks. \n", str(e))