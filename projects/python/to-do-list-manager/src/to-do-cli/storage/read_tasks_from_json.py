import os
import json

default_file_path = "projects/python/to-do-list-manager/data/to_do_tasks.json"

def read_tasks(file_path = None):
    try:
        # check if main is passing file path, if yes overwrite default path
        if file_path:
            default_file_path = file_path

        if not os.path.exists(default_file_path):
            print("Starting fresh, no tasks created yet. Create first task.")
        else:
            with open(default_file_path, "r") as jfile:
                tasks_data = json.load(jfile)
            
            if not tasks_data:
                print("No tasks present in json file")
            else:
                print("Tasks are loaded from json file:", tasks_data)

        return tasks_data
    except json.JSONDecodeError:
        print("❌ File is not valid JSON — resetting to empty list.")
        tasks = []
    except FileNotFoundError:
        print("❌ File not found.")
        tasks = []
    except Exception as e:
        print(f"⚠️ Unexpected error while reading: {e}")
