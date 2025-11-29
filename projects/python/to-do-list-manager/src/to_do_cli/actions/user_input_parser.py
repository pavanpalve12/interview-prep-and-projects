import argparse
import textwrap

def parse_user_input():
    parser = argparse.ArgumentParser(
        prog="to_do_cli",
        usage="python3 -m to_do_cli.main <command> [options]",
        description=textwrap.dedent("""\
            A simple command-line To-Do List manager.

            You can:
              • Add new tasks
              • Delete existing tasks
              • Update a task’s description
              • Mark a task’s status as 'to-do', 'in-progress', or 'done'
              • List all tasks, or filter them by status
        """),
        epilog=textwrap.dedent("""\
            Examples:
              python3 -m to_do_cli.main add "Attend Yoga Class at 6 AM"
              python3 -m to_do_cli.main add "Make Breakfast"
              python3 -m to_do_cli.main update 2 "Make Eggs for Breakfast"
              python3 -m to_do_cli.main mark-in-progress 2
              python3 -m to_do_cli.main mark-done 1
              python3 -m to_do_cli.main list
              python3 -m to_do_cli.main list --status done
        """),
        formatter_class=argparse.RawTextHelpFormatter
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