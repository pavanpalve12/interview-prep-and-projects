# Core Imports - Class and utility functions
from to_do_cli.core import task as task
from to_do_cli.core import task_utils as tu
from to_do_cli.core import tabulate_data as td
# Actions Imports - business logic for each user action
from to_do_cli.actions import user_input_parser as uip
from to_do_cli.actions import add_task as at
from to_do_cli.actions import delete_task as dt
from to_do_cli.actions import update_task as ut
from to_do_cli.actions import list_task as lt
from to_do_cli.actions import mark_task_status as mts
# Storage Imports - json read and write functions
from to_do_cli.storage import read_tasks_from_json as rjfile
from to_do_cli.storage import write_tasks_to_json as wjfile
# Other standard imports
from pathlib import Path as path
import sys


def main():
    # variable declarations
    task_obj = task.task()
    task_data = []        

    # data file path resolution / build
    application_base_dir = path(__file__).resolve().parents[2]
    data_dir = application_base_dir / "data"
    task_data_file_path = data_dir / "to_do_tasks.json"
    path.mkdir(data_dir, exist_ok = True) 
    #print("Task Data File Path -> ", task_data_file_path)

    # user input from command line
    parser = uip.parse_user_input()
    args = parser.parse_args()
    
    user_input_dict = vars(args)    
    user_input_keys = user_input_dict.keys()

    user_action = user_input_dict["action"] if "action" in user_input_keys else None
    user_task_id = user_input_dict["task_id"] if "task_id" in user_input_keys else None
    user_description = user_input_dict["description"] if "description" in user_input_keys else None
    user_status = user_input_dict["status"] if "status" in user_input_keys else None
    # print (user_action, user_task_id, user_description, user_status)
    
    # routing actions based on user inputs
    if user_action == "add":
        at.add_task(task_data_file_path, task_obj, user_description)
        td.display_data_table(rjfile.read_tasks(task_data_file_path))                
    elif user_action == "update":
        ut.update_task(task_data_file_path, user_task_id, user_description)
        td.display_data_table(rjfile.read_tasks(task_data_file_path))
    elif user_action == "delete":
        dt.delete_task(task_data_file_path, user_task_id)
        td.display_data_table(rjfile.read_tasks(task_data_file_path))
    elif user_action == "mark-done":
        mts.mark_task(task_data_file_path, user_task_id, user_action[5:])
        td.display_data_table(rjfile.read_tasks(task_data_file_path))
    elif user_action == "mark-in-progress":
        mts.mark_task(task_data_file_path, user_task_id, user_action[5:])
        td.display_data_table(rjfile.read_tasks(task_data_file_path))
    elif user_action == "list":
        lt.list_tasks(task_data_file_path, user_status)
    else:
        print("Incorrect Input Received")

#-------------------------- Entry Point ----------------------------------------------------------
# Execute the code
if __name__ == "__main__":
    main()