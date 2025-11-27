# Function: To display task
def display_task(curr_task):
    print("-" * 20 + " Task Info " + "-" * 20)
    print('\n'.join(["\t{} -> {}".format(key, value) for key, value in curr_task.items()]))
    print("-" * (42 + len(" Task Info ")))

# Function: To fetch latest tasks id from all tasks
def fetch_task_id(tasks_list):
    if not len(tasks_list):
        return 1
    else:
        return max([t["id"] for t in tasks_list]) + 1
