from datetime import datetime

#-------------------------- Class Definition ----------------------------------------------------------
class task:
    # Task constructor to initialise the task properties
    def __init__(self):
        self.id = None
        self.description = ""
        self.status = ""
        self.createdAt = None
        self.updatedAt = None

    # Method: To convert task in dictionary format
    def task_to_dict(self):
        task_dict = {
            "id": self.id,
            "description": self.description,
            "status": self.status,
            "createdAt": self.createdAt,
            "updatedAt": self.updatedAt
        }
    
        return task_dict
    
    # Method: Initialize class task
    def initialize(self, description, task_id):
        now = datetime.now().strftime("%Y-%m-%d %I:%M:%S %p")
        self.id = task_id
        self.description = description.title()
        self.status = "to-do"
        self.createdAt = now
        self.updatedAt = now    
        return self
