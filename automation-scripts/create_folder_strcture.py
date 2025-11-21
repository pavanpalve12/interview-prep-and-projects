#!/usr/bin/env python3
import os
import sys
import datetime

# -------------------------------------------------------
# Helper functions
# -------------------------------------------------------

def trim(s: str) -> str:
    """Trim leading/trailing whitespace."""
    return s.strip()

def to_title(folder_name: str) -> str:
    """Convert hyphen/underscore names to Title Case words."""
    base = os.path.basename(folder_name)
    spaced = base.replace("-", " ").replace("_", " ")
    return " ".join(w.capitalize() for w in spaced.split())

# -------------------------------------------------------
# Parse input file (key=value format)
# -------------------------------------------------------

if len(sys.argv) != 2:
    print("Usage: python3 create_folder_structure.py <input_file>")
    sys.exit(1)

input_file = sys.argv[1]

if not os.path.isfile(input_file):
    print(f"Error: input file '{input_file}' not found.")
    sys.exit(1)

kv = {}  # key-value pairs

with open(input_file, "r", encoding="utf-8") as f:
    for raw in f:
        line = raw.strip()
        if not line or line.startswith("#"):
            continue
        if "=" not in line:
            continue
        key, value = line.split("=", 1)
        key = key.strip().lower()
        value = value.strip()
        kv[key] = value

# -------------------------------------------------------
# Required values
# -------------------------------------------------------

destination_path = kv.get("destination_path")
if not destination_path:
    print("Error: destination_path key missing in input file.")
    sys.exit(1)

folders_raw = kv.get("folders")
if not folders_raw:
    print("Error: folders key is missing or empty.")
    sys.exit(1)

# platform & difficulty are optional but you provided them
platform = kv.get("platform", "")
difficulty = kv.get("difficulty", "")

# -------------------------------------------------------
# Build list of folders (comma-separated)
# -------------------------------------------------------

folders = [trim(f) for f in folders_raw.split(",") if trim(f)]
if not folders:
    print("Error: No valid folders parsed from input file.")
    sys.exit(1)

# -------------------------------------------------------
# Create folders + files
# -------------------------------------------------------

today = datetime.date.today().isoformat()
author = "pavanpalve12"

os.makedirs(destination_path, exist_ok=True)

for folder in folders:
    target = os.path.join(destination_path, folder)
    os.makedirs(target, exist_ok=True)

    ps = os.path.join(target, "problem-statement.md")
    ex = os.path.join(target, "explanation.md")
    sol = os.path.join(target, "solution.sql")

    title = to_title(folder)
    solved_date = today
    id_val = folder
    slug_val = folder

    # Write problem-statement.md (only if not exists)
    if not os.path.exists(ps):
        with open(ps, "w", encoding="utf-8") as f:
            f.write(
                "------------------------------------------------------------------------\n"
                f"title: {title}\n"
                f"platform: {platform}\n"
                f"id: {id_val}\n"
                f"slug: {slug_val}\n"
                f"difficulty: {difficulty}\n"
                "time_taken_minutes:\n"
                "attempts:\n"
                f"solved_date: {solved_date}\n"
                f"author: {author}\n"
                "------------------------------------------------------------------------\n"
            )

    # Create explanation.md + solution.sql (if missing)
    if not os.path.exists(ex):
        open(ex, "w").close()

    if not os.path.exists(sol):
        open(sol, "w").close()

print(f"Done. Created {len(folders)} folders under {destination_path}")
