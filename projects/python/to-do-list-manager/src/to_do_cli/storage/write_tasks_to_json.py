import json
import os

def write_tasks(task_data, file_path):
    try:
        # print("Writing tasks to json file at -> ", file_path)        
        with open(file_path, "w") as jfile:
            json.dump(task_data, jfile, indent = 4)
    except Exception as e:
        print("Error while saving tasks. \n", str(e))
    else:
        return True