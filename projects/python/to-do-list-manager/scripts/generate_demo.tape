Output scripts/to_do_cli_demo.gif

Set Shell "bash"
Set FontFamily "Menlo"
Set FontSize 16
Set LineHeight 1.2
Set Padding 14
Set Width 1100
Set Height 600
Set WindowBar Colorful
Set TypingSpeed 80ms

Require "python3"

# --- Add task commands ---
Type "python3 -m to_do_cli.main --help" Sleep 500ms Enter Sleep 5s
Type "clear" Sleep 100ms Enter Sleep 200ms
Type "python3 -m to_do_cli.main add 'attend yoga session'" Sleep 300ms Enter Sleep 1s
Type "python3 -m to_do_cli.main add 'make breakfast and coffee'" Sleep 300ms Enter Sleep 1s
Type "python3 -m to_do_cli.main add 'complete to-do list project'" Sleep 300ms Enter Sleep 1s
Type "python3 -m to_do_cli.main add 'play cod'" Sleep 300ms Enter Sleep 2s
Type "clear" Sleep 100ms Enter Sleep 200ms


# --- Update task commands ---
Type "python3 -m to_do_cli.main update 1 'attend gym class'" Sleep 300ms Enter Sleep 1s
Type "python3 -m to_do_cli.main update 1 'attend yoga and gym class'" Sleep 300ms Enter Sleep 2s
Type "clear" Sleep 100ms Enter Sleep 200ms


# --- Mark task commands ---
Type "python3 -m to_do_cli.main mark-in-progress 3" Sleep 300ms Enter Sleep 1s
Type "python3 -m to_do_cli.main mark-done 2" Sleep 300ms Enter Sleep 2s
Type "clear" Sleep 100ms Enter Sleep 200ms

# --- Delete task command ---
Type "python3 -m to_do_cli.main delete 4" Sleep 300ms Enter Sleep 2s
Type "clear" Sleep 100ms Enter Sleep 200ms

# --- List task commands ---
Type "python3 -m to_do_cli.main list" Sleep 300ms Enter Sleep 1s
Type "python3 -m to_do_cli.main list 'to-do'" Sleep 300ms Enter Sleep 1s
Type "python3 -m to_do_cli.main list 'in-progress'" Sleep 300ms Enter Sleep 1s
Type "python3 -m to_do_cli.main list 'done'" Sleep 300ms Enter Sleep 2s
Type "clear" Sleep 100ms Enter Sleep 200ms

# --- Final Task List ---
Type "python3 -m to_do_cli.main list" Sleep 300ms Enter Sleep 1s
Sleep 5s
