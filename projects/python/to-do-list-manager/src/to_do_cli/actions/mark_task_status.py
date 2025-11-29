from to_do_cli.core import task_utils as tu
from to_do_cli.core import tabulate_data as td
from to_do_cli.storage import read_tasks_from_json as rjfile
from to_do_cli.storage import write_tasks_to_json as wjfile

def mark_task(task_data_file_path, task_id, task_status):
    try:
        # reading tasks from json file
        task_data = rjfile.read_tasks(task_data_file_path)
        current_task_status = None
        #print(task_data, task_id, task_status)

        index_of_task = tu.get_index_of_task(task_data, task_id)
        # print("index of searched task", index_of_task)
        if index_of_task is not None:
            current_task_status = task_data[index_of_task]["status"]
            print("""Updating status for task {}, "{}" --> "{}". """.format(task_id, current_task_status, task_status))
            task_data[index_of_task]["status"] = task_status

            td.display_data_table([task_data[index_of_task]])

            # Write updated task to json file
            wjfile.write_tasks(task_data, task_data_file_path)
            #if wjfile.write_tasks(task_data, task_data_file_path):
            #    print("Write successful")
            #else:
            #    print("Write failed")
        else:
            print("Provide valid task id.")
            print("No tasks with task id -> {} are found in tasks".format(task_id)) 
    except IndexError as ie:
        print(str(e))
    except Exception as e:
        print(str(e))
    else:
        return True

