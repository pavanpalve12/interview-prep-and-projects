from core.task import task
from core.utility_functions import display_task, fetch_task_id
from actions.user_input_parser import parse_user_input
from storage.read_write_json import *

def main():
    # variable declarations
    t1 = task()
    tasks_list = []        

    # user input from command line
    parser = parse_user_input()
    args = parser.parse_args()
    
    user_input_dict = vars(args)
    print(str(user_input_dict))
    
    if user_input_dict["action"] == "add":
        t1.initialize(user_input_dict["description"], fetch_task_id(tasks_list))
        t1.createdAt = datetime.now().isoformat()
        t1.updatedAt = datetime.now().isoformat()

        curr_task = t1.task_to_dict()
        display_task(curr_task)

        store_flag = store_tasks(tasks_list, curr_task)
        if store_flag:
            print("Task is stored in tasks list")
        else:
            print("Task is not stored in tasks list")
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