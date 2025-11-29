import json
import pytest
from src.to_do_cli.actions.add_task import add_task
from src.to_do_cli.core.task import task
from src.to_do_cli.core.tabulate_data import display_data_table
from tests.validate_data_storage import assert_storage_valid

# Function: test case to test add task
def test_add_task(tmp_path, capsys):
    test_file = tmp_path / "testfile.json"
    test_file.write_text(json.dumps([], indent=2))
    
    test_user_input_1 = ["add", "buy red pencil"]

    t1 = task()
    add_task(test_file, t1, test_user_input_1[1])
        
    with open(test_file, "r", encoding = "utf-8") as tf:
        test_data = json.load(tf)

    assert_storage_valid(test_data)
    assert len(test_data) == 1 and test_data[0]["description"] == test_user_input_1[1].title()
    display_data_table(test_data)


