from to_do_cli.core import task_utils as tu
from to_do_cli.core import tabulate_data as td
from to_do_cli.storage import read_tasks_from_json as rjfile
from to_do_cli.storage import write_tasks_to_json as wjfile

def update_task(task_data_file_path, task_id, description):
    try:
        # reading tasks from json file
        task_data = rjfile.read_tasks(task_data_file_path)
        current_task_description = None

        # find task with provided task id
        # print("Find task with task id", task_id)
        index_of_task = tu.get_index_of_task(task_data, task_id)
        if index_of_task is not None:
            # update description of task with provided task id
            current_task_description = task_data[index_of_task]["description"]
            print("""Updating description for task {}, "{}" --> "{}". """.format(task_id, current_task_description, description))

            task_data[index_of_task]["description"] = description.title()

            #td.display_data_table([task_data[index_of_task]])

            wjfile.write_tasks(task_data, task_data_file_path)
            # Write updated task to json file
           # if wjfile.write_tasks(task_data, task_data_file_path):
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

