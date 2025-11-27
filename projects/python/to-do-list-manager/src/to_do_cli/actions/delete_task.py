from to_do_cli.core import utility_functions as uf

def delete_task(task_data, task_id):
    try:
        index_of_task = uf.get_index_of_task(task_data, task_id)
        removed_task = task_data.pop(index_of_task)

        uf.display_tasks([removed_task])

    except IndexError as ie:
        print(str(ie))
    except Exception as e:
        print(str(e))
    else:
        return True
