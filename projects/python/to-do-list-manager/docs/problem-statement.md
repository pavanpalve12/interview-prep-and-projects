## **To-Do List Manager – CLI Based**

---

### 📝 **Overview**
The **Task Tracker (To-Do List Manager)** is a command-line interface (CLI) application for managing personal or work tasks.  
It allows users to add, update, delete, and track the progress of their tasks directly from the terminal.

This project focuses on **hands-on practice** with:
- Command-line argument handling  
- File I/O operations  
- JSON data storage  
- Error handling and input validation  

---

### ⚙️ **Requirements**

The application should:
- Run entirely from the **command line**
- Accept user **actions and arguments** (e.g., `add`, `update`, `delete`, etc.)
- Store all tasks in a **JSON file** located in the current directory  
- Automatically **create the JSON file** if it doesn’t exist  
- Handle invalid inputs and missing files **gracefully**

---

### ✅ **Core Features**

| Action | Description |
|---------|--------------|
| **Add** | Create a new task with a description |
| **Update** | Modify an existing task’s description |
| **Delete** | Remove a task by ID |
| **Mark In-Progress / Done** | Change the task status |
| **List All** | Display all tasks |
| **List by Status** | Filter tasks by status (todo / in-progress / done) |

---

### 📦 **Task Structure**

Each task stored in the JSON file must include:

| Property | Description |
|-----------|-------------|
| `id` | Unique identifier for each task |
| `description` | Short text describing the task |
| `status` | One of: `todo`, `in-progress`, `done` |
| `createdAt` | Timestamp when the task was created |
| `updatedAt` | Timestamp when the task was last updated |

---

### 🧱 **Implementation Constraints**

- Use **only standard libraries** (no external dependencies)  
- Use your language’s **native file system module** for reading/writing JSON  
- Support **positional command-line arguments** for user input  
- Handle missing arguments, invalid IDs, or corrupt JSON data safely  

---

### 🚀 **Development Guidelines**

1. **Set up** your environment and initialize a Git repository.  
2. **Design** the CLI structure (command parser and subcommands).  
3. **Implement** features incrementally (add → list → update → mark → delete).  
4. **Test** each feature to ensure data integrity and correct JSON behavior.  
5. **Polish** with helpful error messages and clear command usage.  

---

### 🧠 **Learning Outcomes**

By completing this project, you will:
- Strengthen command-line and file handling skills  
- Practice modular design and incremental development  
- Learn how to build a **CLI-based CRUD system** from scratch  

---
