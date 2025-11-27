# 🗂️ TO DO LIST MANAGER - CLI BASED
> A simple command-line tool to track, manage, and organize your tasks efficiently.
Task Tracker is a project used to track and manage your tasks.  
It’s a **CLI-based application** that lets you add, update, delete, and mark tasks as done or in progress — all from your terminal.  
This project helps you practice handling user inputs, working with the filesystem, and building a minimal yet practical CLI tool that stores data in JSON.
---

## 🧩 Installation -- Update with actual commands 

OS X & Linux:

```sh
# Example (Python)
git clone https://github.com/yourname/task-tracker-cli.git
cd task-tracker-cli
python3 task_cli.py --help
```

Windows:

```sh
# Example
py task_cli.py --help
```

---

## ▶️ Usage Example -- Update with actual commands 

A few motivating and useful examples of how your Task Tracker CLI can be used.

```bash
# Adding a new task
task-cli add "Buy groceries"
# Output: Task added successfully (ID: 1)

# Updating and deleting tasks
task-cli update 1 "Buy groceries and cook dinner"
task-cli delete 1

# Marking a task as in progress or done
task-cli mark-in-progress 1
task-cli mark-done 1

# Listing all tasks
task-cli list

# Listing tasks by status
task-cli list done
task-cli list todo
task-cli list in-progress
```

_For more examples and usage, please refer to the [Wiki][wiki]._

---

## 🧱 Requirements

The application should:

- Run from the command line and accept user actions as arguments.  
- Store tasks in a local **JSON file** (auto-created if missing).  
- Support the following operations:
  - Add, Update, Delete tasks  
  - Mark tasks as **todo**, **in-progress**, or **done**  
  - List tasks (all or filtered by status)

**Implementation Constraints:**
- Use **native filesystem modules** (no external libraries or frameworks).  
- Handle **errors and edge cases** gracefully.  
- The project can be built in any programming language.

---

## 🗃️ Task Properties

Each task must have the following fields:

| Property | Description |
|-----------|--------------|
| `id` | Unique identifier for the task |
| `description` | Short text about the task |
| `status` | Task state: `todo`, `in-progress`, or `done` |
| `createdAt` | Timestamp when task was created |
| `updatedAt` | Timestamp when task was last updated |

---

## 💻 Development Setup

Describe how to install dependencies and run tests here.

```sh
# Example commands
make install
pytest -q
```

---

## 🧾 Release History

* 0.1.0
  * The first functional release — supports add, list, update, delete, mark status.

---

## 🧠 Meta

Your Name – [@YourTwitter](https://twitter.com/YourTwitter) – YourEmail@example.com

Distributed under the XYZ license. See ``LICENSE`` for more information.

[https://github.com/yourname/task-tracker-cli](https://github.com/yourname/task-tracker-cli)

---

## 🤝 Contributing

1. Fork it (<https://github.com/yourname/task-tracker-cli/fork>)
2. Create your feature branch (`git checkout -b feature/add-new-command`)
3. Commit your changes (`git commit -am 'Add new command'`)
4. Push to the branch (`git push origin feature/add-new-command`)
5. Create a new Pull Request

---


[def]: projects/python/to-do-list-manager/readme_banner.png