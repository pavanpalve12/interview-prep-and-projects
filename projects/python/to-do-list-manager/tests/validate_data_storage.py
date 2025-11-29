"""
------------------------------------------------------------------------
Purpose: 
    -> test json file used for storing tasks
    -> sets up reusable assertion to check json at each user action
    -> returns json_data if valid else assertion error
------------------------------------------------------------------------
"""

from typing import Any, List, Dict
from src.to_do_cli.core import tabulate_data as td
from datetime import datetime
import re

def log_error(error_log, keys, values):
    """
    Returns error found in dictionary format to be added to errors log
    """    
    error_log.append(dict(zip(keys, values)))
    return error_log

def validate_storage_collect_errors(data: Any) -> None:
    """
    Validate each task stored json file with format, type and essential checks
    
    Expected JSON Format: list of tasks (as dictionaries)
    [
        {
            "id": 1,
            "description": "Buy Groceries",
            "status": "to-do",
            "createdAt": "2025-11-28 11:54:12 AM",
            "updatedAt": "2025-11-28 11:54:12 AM"
        },
        ....
    ]

    Collects all invalid tasks.
    """
    # error_log = [{"index": idx, "task_id": task_id, "error_msg": "msg"}]    
    error_log = []
    error_log_keys = "task_id error_value error_msg rule".split(" ")
    checked_ids = set()

    # validations for task data in json file
    if not isinstance(data, list):
        msg = [1, "", "data is not in list format", "task data must be a list of tasks"]
        error_log = log_error(error_log, error_log_keys, msg)
        return error_log

    # idx = index and task is each dict -> 0 {first dict} 1 {second dict} ...
    for idx, task in enumerate(data):
        error_msg, rule = None, None
        errors = []  

        # check for task is dictionary
        if not isinstance(task, dict):
            msg = [idx, "", "task is not in dictionary format", "tasks must be stored as list of dictionary format"]
            error_log = log_error(error_log, error_log_keys, msg)
        else:
            # ------------------------------------------------------------      
            # check for id values        
            task_id = task.get("id")
            if not isinstance(task_id, int):
                error_msg = "non integer task_id found"
                rule = "task_id must be of int type"
                errors.append([task_id, task_id, error_msg, rule])
            elif task_id <= 0:
                error_msg = "task_id is zero or less than found"
                rule = "task_id must start from 1"
                errors.append([task_id, task_id, error_msg, rule])                        
            elif task_id in checked_ids:
                error_msg = "duplicate task_id found"
                rule = "task_id must be unique"
                errors.append([task_id, task_id, error_msg, rule])   
            else:
                checked_ids.add(task_id)

            # ------------------------------------------------------------
            # check for description values
            task_description = task.get("description")
            if not isinstance(task_description, str):
                error_msg = "non string description found" 
                rule = "description should be a string"
                errors.append([task_id, task_description, error_msg, rule])
            if not (task_description).strip():
                error_msg = "empty description found"
                rule = "description should not be empty"
                errors.append([task_id, task_description, error_msg, rule])
            if not task_description == task_description.title():
                error_msg = "description not in title case"
                rule = "description should not be in title case"
                errors.append([task_id, task_description, error_msg, rule])
            if '"' in task_description or "'" in task_description:
                error_msg = """description has ' / " inside"""
                rule = "description should not have single or double quotes"
                errors.append([task_id, task_description, error_msg, rule])
            # ------------------------------------------------------------
            # check for status values
            task_status = task.get("status")
            if not task_status in {"to-do", "in-progress", "done"}:
                error_msg = "invalid status found"
                rule = "status should be to-do / in-progress / done"
                errors.append([task_id, task_status, error_msg, rule])
            # ------------------------------------------------------------
            # check for createdAt values and updatedAt values
            for k in ("createdAt", "updatedAt"):
                if k in task:
                    ts = str(task.get(k))                
                    if not isinstance(ts, str):                
                        error_msg = "non string date value found" 
                        rule = f"{k} should be a string"
                        errors.append([task_id, ts, error_msg, rule])
                    if not ts.strip():
                        error_msg = "empty date found"
                        rule = f"{k} should not be empty"
                        errors.append([task_id, ts, error_msg, rule])
                    if not re.match(r'^\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}\s(?:AM|PM)', ts):
                        error_msg = "incorrect date found"
                        rule = f"{k} should not be formatted as YYYY-MM-DD HH:MM:SS AM/PM"
                        errors.append([task_id, ts, error_msg, rule])

        # ------------------------------------------------------------
        # for each task_id append errors found and add id to checked id list
        for e in errors:
            error_log = log_error(error_log, error_log_keys, e)        
    return error_log

def assert_storage_valid(data: Any) -> None:
    error_log = validate_storage_collect_errors(data)
    if error_log:
        print("Storage validation failed with the following issues:")
        #td.display_data_table(error_log)
        return error_log
