# tests/test_storage_negative.py
import json
from src.to_do_cli.core.tabulate_data import display_data_table
from tests.validate_data_storage import assert_storage_valid
import pytest

def test_invalid_storage_reports_all_issues():
    # Manually write a broken storage file to simulate corruption

    bad_data = [
        {
            "id": 1,
            "description": "Buy Groceries",
            "status": "todo",
            "createdAt": "2025-11-28 11:54:12 AM",
            "updatedAt": "2025-11-28 11:54:12 AM"
        },
        {
            "id": 2.0,
            "description": "make Dinner",
            "status": "in-progress",
            "createdAt": "2025-11-28 11:54",
            "updatedAt": "2025-11-28 11:54:44 AM"
        },
        "not-a-dict"
    ]
    #storage_file.write_text(json.dumps(bad_data), encoding="utf-8")

    # This call will raise ONE AssertionError listing ALL problems found
    error_log = assert_storage_valid(bad_data)
    display_data_table(error_log)

test_invalid_storage_reports_all_issues()