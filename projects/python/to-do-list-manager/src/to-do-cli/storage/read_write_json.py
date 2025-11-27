# Function: To store tasks in a list (each task is in a dictionary format)
def store_tasks(tasks_list, curr_task):
    len_before = len(tasks_list)
    tasks_list.append(curr_task)
    len_after = len(tasks_list)

    return len_before < len_after
