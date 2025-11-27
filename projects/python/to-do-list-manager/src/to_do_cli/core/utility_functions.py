from tabulate import tabulate

# Function: To display task
def display_tasks(task_data):
    headers = task_data[0].keys()
    rows = [task.values() for task in task_data]
    print(tabulate(rows, headers = headers, tablefmt="fancy_grid"))

# Function: To fetch latest tasks id from all tasks
def get_latest_task_id(task_data):
    if not len(task_data):
        return 1
    else:
        return max([t["id"] for t in task_data]) + 1
    
def get_index_of_task(task_data, task_id):
    try:
        task_to_be_removed = [task for task in task_data if task["id"] == task_id][0]
        index_of_task = task_data.index(task_to_be_removed)        

    except IndexError as ie:
        print(str(ie))
    except Exception as e:
        print(str(e))
    else:
        return index_of_task
