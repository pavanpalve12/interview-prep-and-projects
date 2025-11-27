from tabulate import tabulate

# Function: To display task
def display_tasks(task_data):
    headers = task_data[0].keys()
    rows = [task.values() for task in task_data]
    print(tabulate(rows, headers = headers, tablefmt="fancy_grid"))

# Function: To fetch latest tasks id from all tasks
def fetch_task_id(tasks_list):
    if not len(tasks_list):
        return 1
    else:
        return max([t["id"] for t in tasks_list]) + 1

json_data = [
    {
        'id': "1", 'description': 'Buy groceries', 'status': 'todo', 'createdAt': '2025-11-27T20:53:27.588243', 'updatedAt': '2025-11-27T20:53:27.588243'
    },
    {
        'id': 2, 'description': 'Clean room', 'status': 'done', 'createdAt': '2025-11-27T20:53:27.588243', 'updatedAt': '2025-11-27T20:53:27.588243'
    }
]    


