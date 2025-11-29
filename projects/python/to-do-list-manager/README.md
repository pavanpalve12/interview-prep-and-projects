<h1 align="center">
  <a href="https://github.com/pavanpalve12">
    <img src="https://github.com/pavanpalve12/interview-prep-and-projects/blob/764da540f36220889135411a55656798d70425c0/dev_logo.png" height = "45" width="60" align="left">
  </a>
  📋 To-Do List Manager - CLI BASED
</h1>

<a href="https://roadmap.sh/projects/task-tracker" target="_blank">
  <img 
    src="/projects/python/to-do-list-manager/scripts/to_do_cli_demo.gif" 
    alt="Preview"
    width="800" 
    height="400"
  >
</a>

---
# Description
> A lightweight command-line tool to manage daily tasks efficiently — add, update, delete, mark progress, and list tasks by status.
Built with Python and argparse for robust CLI handling and clean output formatting.
Demonstrates modular design, test-driven development, and user-centric command structuring.
Ideal for developers learning how to build maintainable, testable CLI applications in Python.
---
# 🧩 **Problem Statement**

The **To-Do List Manager (CLI-Based)** is a terminal application to manage daily tasks — allowing users to **add, update, delete, and track progress** directly from the command line.  
It emphasizes practical experience with **CLI argument parsing, JSON file storage, and error handling.**

---

### ⚙️ **Requirements**
- Runs entirely in the **terminal**.  
- Accepts user actions such as `add`, `update`, `delete`, `mark`, and `list`.  
- Stores tasks in a local **JSON file**, creating it automatically if missing.  
- Handles invalid input, file errors, and missing arguments gracefully.  

---

### ✅ **Core Features**
- **Add / Update / Delete** tasks.  
- **Mark** tasks as *to-do*, *in-progress*, or *done*.  
- **List** all tasks or filter by status.  

---

### 📦 **Task Structure**

| Key | Type | Description |
|------|------|-------------|
| `id` | `int` | Unique identifier for each task |
| `description` | `string` | Short text describing the task |
| `status` | `string` | One of: `to-do`, `in-progress`, or `done` |
| `createdAt` | `string` | Timestamp when the task was created |
| `updatedAt` | `string` | Timestamp when the task was last updated |

Example:
```json
{
  "id": 1,
  "description": "Attend Yoga Class at 6 AM",
  "status": "in-progress",
  "createdAt": "2025-11-29T09:00:00Z",
  "updatedAt": "2025-11-29T09:30:00Z"
}
---
# 🧩 Installation -- Update with actual commands 
📍 Project Location <br>
You can find the complete To-Do List CLI project on GitHub: <br>
👉 pavanpalve12/interview-prep-and-projects – To-Do List Manager <br>

💻 macOS & Linux <br>
```bash
git clone https://github.com/pavanpalve12/interview-prep-and-projects.git 
cd interview-prep-and-projects/projects/python/to-do-list-manager 
python3 -m to_do_cli.main --help 
```

🪟 Windows
```bash
git clone https://github.com/pavanpalve12/interview-prep-and-projects.git
cd interview-prep-and-projects\projects\python\to-do-list-manager
py -m to_do_cli.main --help 
```

---
# 🚀 Project Features – To-Do CLI

- **Add, Update, Delete Tasks** — Manage your daily to-dos with simple, intuitive commands.
- **Mark Progress** — Set task status as to-do, in-progress, or done.
- **List & Filter** — View all tasks or filter by specific status for quick tracking.
- **Persistent Storage** — Saves tasks locally for seamless session continuity.
---
# ⚙️ Project Workflow
- User Command Input — The user interacts through terminal commands like add, update, delete mark-done, or list.
- Argument Parsing — argparse interprets the command and routes it to the correct function.
- Task Processing — The command handler updates in-memory task data (add, modify, delete, or change status).
- Data Persistence — Updated tasks are saved to a local JSON file for session continuity.
- Output Display — Results are printed in a clean, tabular format, reflecting the current task list or filtered view.
---
# 🧠 Meta

Your Name – [@YourTwitter](https://twitter.com/YourTwitter) – YourEmail@example.com

Distributed under the XYZ license. See ``LICENSE`` for more information.

[https://github.com/yourname/task-tracker-cli](https://github.com/yourname/task-tracker-cli)

---

# 🤝 Contributing

1. Fork it (<https://github.com/yourname/task-tracker-cli/fork>)
2. Create your feature branch (`git checkout -b feature/add-new-command`)
3. Commit your changes (`git commit -am 'Add new command'`)
4. Push to the branch (`git push origin feature/add-new-command`)
5. Create a new Pull Request

---
