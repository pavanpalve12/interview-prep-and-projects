from to_do_cli.core import task_utils as tu
from to_do_cli.core import tabulate_data as td
from to_do_cli.storage import read_tasks_from_json as rjfile

def list_tasks(task_data_file_path, status):
    try:
        # reading tasks from json file
        task_data = rjfile.read_tasks(task_data_file_path)

        # filter tasks by status if status is provided else print all tasks
        #print ("\nInside List Tasks")
        #print ("Status -> ", status)
        if status:
            task_data = [task for task in task_data if task["status"] == status]
            #print(task_data)
        
        if task_data:
            td.display_data_table(task_data)    
        else:
            print("No tasks with status -> {} are found in tasks".format(status))            
            
    except IndexError as ie:
        print(str(ie), ie.__traceback__)
        

