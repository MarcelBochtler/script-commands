# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Install port
# @raycast.mode fullOutput
# @raycast.packageName MacPorts
#
# Optional parameters:
# @raycast.icon images/macports.png
# @raycast.needsConfirmation true
# @raycast.argument1 {"type": "text", "placeholder": "Package name"}
#
# Documentation:
# @raycast.description Install a MacPorts port.
# @raycast.author Marcel Bochtler
# @raycast.authorURL https://github.com/MarcelBochtler

on run argv
	do shell script "/opt/local/bin/port install " & item 1 of argv with administrator privileges
end run
