# Core Imports - Class and utility functions
from core.task import *
from core.utility_functions import *
# Actions Imports - business logic for each user action
from actions.user_input_parser import *
from actions.add_task import *
from actions.delete_task import *
from actions.update_task import *
from actions.list_task import *
from actions.mark_task_status import *
# Storage Imports - json read and write functions
from storage.read_tasks_from_json import *
from storage.write_tasks_to_json import *


def main():
    # variable declarations
    t1 = task()
    tasks_list = []        

    # user input from command line
    parser = parse_user_input()
    args = parser.parse_args()
    
    user_input_dict = vars(args)
    print(str(user_input_dict))
    
    # update code to make descripiton as title case

    if user_input_dict["action"] == "add":
        t1.initialize(user_input_dict["description"], get_latest_task_id(tasks_list))
        curr_task = t1.task_to_dict()
        display_tasks(curr_task)
    elif user_input_dict["action"] == "update":
        pass # call update task action
    elif user_input_dict["action"] == "delete":
        pass # call delete task action
    elif user_input_dict["action"] == "mark-done":
        pass # call mark-done task action
    elif user_input_dict["action"] == "mark-in-progress":
        pass # call mark-in-progress action
    elif user_input_dict["action"] == "list":
        pass # call list tasks action
    else:
        print("Incorrect Input Received")

#-------------------------- Entry Point ----------------------------------------------------------
# Execute the code
if __name__ == "__main__":
    main()