# Function: Calculates max length reqd for each column
def _calculate_col_length(task_data):
    key_len_dict = {}

    # for each key in task_data dict (each col)
    for key in task_data[0].keys():    
        len_list = []
        
        # for rows in each column (column wise reading)
        for t in task_data:    
            len_list.append(len(str(t[key])))
        
        key_len_dict[key] = max(len_list) 

    return key_len_dict

# Function: Create header row
def _generate_top_bottom_row(key_len_dict):
    total_row_length = sum([i for i in key_len_dict.values()])
    num_cols = len(key_len_dict)
    #print(total_row_length, num_cols, key_len_dict.values())

    # total length + 5 pipes + 10 spaces + 1 extra at end
    row = "-" * (total_row_length + (num_cols * 3) + 1) 
    return row

# Function: Create header row
def _generate_header_row(key_len_dict):
    header_row = ""

    for key, value in key_len_dict.items():
        start_pipe_column_name = "| {}".format(key)
        spaces_after_column_name = " " * (value - len(key) + 1)  
        header_row += start_pipe_column_name + spaces_after_column_name
    # add last pipe at the end of header row
    header_row +=  "|" 
    return header_row

# Function: Create data rows
def _generate_data_row(task_data, key_len_dict):
    data_rows = []
    for task_dict in task_data:
        curr_row = ""
        for key, value in task_dict.items():
            # find max length reqd for current column from key length dict
            col_length = key_len_dict[key]
            # print("Current col -> {} length reqd -> {} col_name_length -> {}".format(key, col_length, len(str(key))))

            # build data row
            start_pipe_column_name = "| {}".format(value)                
            spaces_after_column_name = " " * (col_length - len(str(value)) + 1)
            curr_row += start_pipe_column_name + spaces_after_column_name
        
        # add last pipe at the end of header row
        curr_row +=  "|" 
        data_rows.append(curr_row)
    return data_rows

# Function: display data as table (data must have header and rows -> list of dict)
def display_data_table(data):
    key_len_dict = _calculate_col_length(data)
    top_row = bottom_row = _generate_top_bottom_row(key_len_dict)
    header_row = _generate_header_row(key_len_dict)
    data_rows = _generate_data_row(data, key_len_dict)

    print(top_row)
    print(header_row)
    print(bottom_row)
    for row in data_rows:
        print(row)
    print(bottom_row)