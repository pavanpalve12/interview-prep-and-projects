from to_do_cli.core import utility_functions as uf

def update_task(task_data, description, task_id):
    try:
        index_of_task = uf.get_index_of_task(task_data, task_id)
        task_data[index_of_task]["description"] = description

        uf.display_tasks([task_data[index_of_task]])
    except IndexError as ie:
        print(str(e))
    except Exception as e:
        print(str(e))
    else:
        return True

