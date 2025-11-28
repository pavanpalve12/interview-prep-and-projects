from tabulate import tabulate

# Function: To display task
def display_tasks(task_data):
    headers = task_data[0].keys()
    rows = [task.values() for task in task_data]
    print(tabulate(rows, headers = headers, tablefmt="fancy_grid"))

# Function: To fetch latest tasks id from all tasks
def get_latest_task_id(task_data):
    if not task_data:
        return 1
    else:
        return max([t["id"] for t in task_data]) + 1
    
def get_index_of_task(task_data, task_id):
    try:
        searched_task = [task for task in task_data if task["id"] == task_id] 
        # print(searched_task)
        if searched_task:
            index_of_task = task_data.index(searched_task[0]) 
            return index_of_task
        else:
            return None

    except IndexError as ie:
        print(str(ie))
    except Exception as e:
        print(str(e))
        
