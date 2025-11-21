#!/usr/bin/env bash
set -euo pipefail

###############################################################################
# make_folders_from_numbered_input.sh
#
# Purpose:
#   Read an input file with numbered folder keys (folder_name_1, folder_name_2, ...)
#   plus simple key=value metadata (destination_path, platform, difficulty).
#   Create directories under destination_path and three files in each:
#     - problem-statement.md
#     - explanation.md
#     - solution.sql
#
# Key behaviors (intentional, simple rules):
#   - Title is ALWAYS generated from the folder name:
#       replace hyphens/underscores with spaces and Title-Case each word.
#   - id and slug are ALWAYS the folder name exactly as provided.
#   - time_taken_minutes and attempts are ALWAYS printed as blank placeholders.
#   - solved_date is ALWAYS today's date (YYYY-MM-DD).
#   - author is hardcoded to "pavanpalve12".
#
# Input format (example):
#   folder twitter-histogram-of-tweets, linkedin-data-science-skills
#   ... comma separated value
#   destination_path = /Users/pavan/Workspace/00-Tech-Workspace/Temporary Workspace
#   platform = datalemur
#   difficulty = easy
#
# Usage:
#   ./make_folders_from_numbered_input.sh input.txt
#
###############################################################################

#!/usr/bin/env bash
# Optimized minimal script: single key=value input, folders as comma-separated list.
set -euo pipefail

# -----------------------
# Usage & basic checks
# -----------------------
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <input_file>"
  exit 1
fi
INPUT_FILE="$1"
if [ ! -f "$INPUT_FILE" ]; then
  echo "Error: input file not found: $INPUT_FILE"
  exit 1
fi

# -----------------------
# Defaults
# -----------------------
today="$(date +%Y-%m-%d)"
author="pavanpalve12"

# -----------------------
# Small helpers
# -----------------------
# trim: remove leading/trailing whitespace
trim() { printf '%s' "$1" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//' ; }

# title-case a single string (replace -/_ with spaces then Title Case via awk)
to_title() {
  s="$1"
  s="${s##*/}"                          # last path component
  s="$(printf '%s' "$s" | sed -E 's/[-_]+/ /g')"
  printf '%s' "$s" | awk '{
    for(i=1;i<=NF;i++){
      $i = toupper(substr($i,1,1)) tolower(substr($i,2))
    }
    print
  }'
}

# -----------------------
# Parse file: uniform key = value pairs
# -----------------------
declare -A KV
while IFS= read -r raw || [ -n "${raw-}" ]; do
  line="$(trim "$raw")"
  [ -z "$line" ] && continue
  case "$line" in
    \#*) continue ;;          # comment
  esac
  if printf '%s' "$line" | grep -q '='; then
    key="$(printf '%s' "$line" | sed -E 's/=.*$//')"
    val="$(printf '%s' "$line" | sed -E 's/^[^=]*=//')"
    key="$(trim "$key")"
    val="$(trim "$val")"
    key_lc="$(printf '%s' "$key" | tr '[:upper:]' '[:lower:]')"
    KV["$key_lc"]="$val"
  fi
done < "$INPUT_FILE"

# -----------------------
# Validate required keys
# -----------------------
DEST="${KV[destination_path]:-${KV[destination]:-}}"
if [ -z "$DEST" ]; then
  echo "Error: destination_path key missing in input file."
  exit 1
fi

# parse folders: comma-separated
raw_folders="${KV[folders]:-}"
if [ -z "$raw_folders" ]; then
  echo "Error: folders key missing or empty in input file."
  exit 1
fi

# split into array by comma, then trim each element
IFS=',' read -r -a ARR <<< "$raw_folders"
FOLDERS=()
for f in "${ARR[@]}"; do
  tf="$(trim "$f")"
  [ -n "$tf" ] && FOLDERS+=("$tf")
done

# quick validation: ensure at least one folder
if [ "${#FOLDERS[@]}" -eq 0 ]; then
  echo "Error: no valid folders parsed."
  exit 1
fi

# -----------------------
# Create destination and folders
# -----------------------
mkdir -p "$DEST"

platform="${KV[platform]:-}"
difficulty="${KV[difficulty]:-}"

for folder in "${FOLDERS[@]}"; do
  target="$DEST/$folder"
  # basic sanitization: forbid empty names or names with newline (quick guard)
  if [ -z "$folder" ] || printf '%s' "$folder" | grep -q $'\n'; then
    echo "Warning: skipping invalid folder name: '$folder'"
    continue
  fi

  mkdir -p "$target"
  ps="$target/problem-statement.md"
  ex="$target/explanation.md"
  sol="$target/solution.sql"

  title="$(to_title "$folder")"
  id="$folder"
  slug="$folder"
  solved_date="$today"

  if [ ! -f "$ps" ]; then
    {
      printf '------------------------------------------------------------------------\n'
      printf 'title: %s\n' "$title"
      printf 'platform: %s\n' "$platform"
      printf 'id: %s\n' "$id"
      printf 'slug: %s\n' "$slug"
      printf 'difficulty: %s\n' "$difficulty
"
      printf 'time_taken_minutes:\n'
      printf 'attempts:\n'
      printf 'solved_date: %s\n' "$solved_date"
      printf 'author: %s\n' "$author"
      printf '------------------------------------------------------------------------\n'
    } > "$ps"
  fi

  [ ! -f "$ex" ] && : > "$ex"
  [ ! -f "$sol" ] && : > "$sol"
done

echo "Done: created ${#FOLDERS[@]} folders under $DEST"
exit 0
