import argparse

def parse_user_input():
    parser = argparse.ArgumentParser(
        prog = "to-do-list-CLI",
        description = "User input from CLI for To-Do List Manager",
        epilog = "Examples:\n  task-cli add \"Buy groceries\"\n  task-cli update 1 \"Cook dinner\"\n  task-cli list done"
    )

    # parsing user input command wise
    subparser = parser.add_subparsers(dest = "action", required = True)

    # inputs for adding a task    
    add_task_parser = subparser.add_parser("add", help = "Add new task")
    add_task_parser.add_argument("description", metavar = "DESCRIPTION", help = "Task description")

    # inputs for deleting a task    
    delete_task_parser = subparser.add_parser("delete", help = "Delete a task")
    delete_task_parser.add_argument("task_id", type = int, metavar = "TASK_ID", help = "Task ID")
    
    # inputs for updating a task 
    update_task_parser = subparser.add_parser("update", help = "Update a task")
    update_task_parser.add_argument("task_id", type = int, metavar = "TASK_ID", help ="Task ID") 
    update_task_parser.add_argument("description", metavar = "DESCRIPTION", help = "Task description")

    # inputs for changing task status - mark-in-progess
    status_task_parser = subparser.add_parser("mark-in-progress", help = "Mark task status as in-progess")
    status_task_parser.add_argument("task_id", type = int, metavar = "TASK_ID", help ="Task ID")

    # inputs for changing task status - mark-done
    status_task_parser = subparser.add_parser("mark-done", help = "Mark task status as done")
    status_task_parser.add_argument("task_id", type = int, metavar = "TASK_ID", help ="Task ID")

    # inputs for listing tasks
    list_task_parser = subparser.add_parser("list", help = "List tasks (optionally filter by status)")
    list_task_parser.add_argument(
        "status", nargs = "?", 
        choices = ["to-do", "in-progress", "done"], 
        metavar = "STATUS", help = "optional status filter"
    )

    return parser