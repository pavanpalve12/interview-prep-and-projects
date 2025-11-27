from to_do_cli.core import utility_functions as uf

def list_tasks(tasks_data, status = None):
    if not status:
        uf.display_tasks(tasks_data)
    else:
        filtered_tasks = [task for task in tasks_data if task["status"] == status]
        uf.display_tasks(filtered_tasks)

