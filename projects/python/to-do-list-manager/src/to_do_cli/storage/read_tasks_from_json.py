import os
import json

def read_tasks(file_path):
    try:        
        #print("Reading tasks from json file from -> ", file_path)

        if not file_path.exists():
            #print("Starting fresh, no tasks created yet. Create first task.")
            task_data = []
        else:
            with open(file_path, "r") as jfile:
                task_data = json.load(jfile)
            
            #if not task_data:
             #   print("No tasks present in json file")
            #else:
             #   print("Tasks are loaded from json file")            

        return task_data
    except json.JSONDecodeError:
        print("❌ File is not valid JSON — resetting to empty list.")
        tasks = []
    except FileNotFoundError:
        print("❌ File not found.")
        tasks = []
    except Exception as e:
        print(f"⚠️ Unexpected error while reading: {e}")
