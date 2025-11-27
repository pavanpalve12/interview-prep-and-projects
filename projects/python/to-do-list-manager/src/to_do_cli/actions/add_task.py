from to_do_cli.core import utility_functions as uf

def add_task(task_data, task):
    task_data.append(task)
    uf.display_tasks(task_data)