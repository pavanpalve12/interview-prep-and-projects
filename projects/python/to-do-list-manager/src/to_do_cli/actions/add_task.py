from to_do_cli.core import task_utils as tu
from to_do_cli.core import tabulate_data as td
from to_do_cli.storage import read_tasks_from_json as rjfile
from to_do_cli.storage import write_tasks_to_json as wjfile

def add_task(task_data_file_path, task_obj, description):
    # Reading data from json file, if file does not exists or empty returns [] else task_data from json
    task_data = rjfile.read_tasks(task_data_file_path)

    # Initialize variables of class task (properties of task)
    task_obj.initialize(description.title(), tu.get_latest_task_id(task_data))

    # Creating a dictionary of task properties for writing to json 
    curr_task = task_obj.task_to_dict()

    # Appending task dictionary to task_data
    task_data.append(curr_task)

    # Writing task data to json file
    wjfile.write_tasks(task_data, task_data_file_path)
    #if wjfile.write_tasks(task_data, task_data_file_path):
     #   print("Write successful")
    #else:
     #   print("Write failed")   