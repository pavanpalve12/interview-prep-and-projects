from to_do_cli.core import task_utils as tu
from to_do_cli.core import tabulate_data as td
from to_do_cli.storage import read_tasks_from_json as rjfile
from to_do_cli.storage import write_tasks_to_json as wjfile

def delete_task(task_data_file_path, task_id):
    try:
        # reading tasks from json file
        task_data = rjfile.read_tasks(task_data_file_path)        

        index_of_task = tu.get_index_of_task(task_data, task_id)
        if index_of_task is not None:
            removed_task = task_data.pop(index_of_task)
            td.display_data_table([removed_task])

            # Write updated task to json file
            wjfile.write_tasks(task_data, task_data_file_path)
            #if wjfile.write_tasks(task_data, task_data_file_path):
             #   print("Write successful")
            #else:
             #   print("Write failed")
        else:
            print("Provide valid task id.")
            print("No tasks with task id -> {} are found in tasks".format(task_id))            
    except IndexError as ie:
        print(str(ie))
    except Exception as e:
        print(str(e))
