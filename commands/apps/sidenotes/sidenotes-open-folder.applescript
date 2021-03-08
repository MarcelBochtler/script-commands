#!/usr/bin/osascript

# Dependency: Requires SideNotes (https://apptorium.com/sidenotes)

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title SideNotes open
# @raycast.mode silent
# @raycast.packageName SideNotes

# Optional parameters:
# @raycast.packageName SideNotes
# @raycast.icon images/sidenotes.png
# @raycast.argument1 { "type": "text", "placeholder": "Folder", "optional": true }

# Documentation:
# @raycast.description Open SideNotes. Optionally in the specified folder.
# @raycast.author Marcel Bochtler
# @raycast.authorURL https://github.com/MarcelBochtler

on run argv
	if application "SideNotes" is not running then
		log "SideNotes is not running"
		return
	end if
	
	tell application "SideNotes"
		set folder_name to item 1 of argv
		
		if folder_name is "" then
			show all folders
		else
			set folder_index to my index_of_folder(folder_name, folders)
			set target_folder to item folder_index of folders
			open folder target_folder
		end if
	end tell
end run

on index_of_folder(folder_name, folder_list)
	repeat with i from 1 to the count of folder_list
		if name of item i of folder_list is folder_name then return i
	end repeat
	
	return -1
end index_of_folder
