#!/usr/bin/osascript

# Dependency: Requires SideNotes (https://apptorium.com/sidenotes)

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Add TODO
# @raycast.mode silent
# @raycast.packageName SideNotes

# Optional parameters:
# @raycast.packageName SideNotes
# @raycast.icon images/sidenotes.png
# @raycast.argument1 { "type": "text", "placeholder": "TODO item" }

# Documentation:
# @raycast.description Create a TODO item within the TODO folder.
# @raycast.author Marcel Bochtler
# @raycast.authorURL https://github.com/MarcelBochtler

on run argv
	if application "SideNotes" is not running then
		log "SideNotes is not running"
		return
	end if
	
	tell application "SideNotes"
		set folder_pos to my index_of_folder("TODO", folders)
		set todo_folder to item folder_pos of folders
		set note_pos to my pos_of_text("# TODO", notes of todo_folder)
		set todo_note to item note_pos of notes of todo_folder
		
		log folder_pos
		log note_pos
		log text of todo_note

		set text of todo_note to text of todo_note & "
[ ] " & item 1 of argv
		
		open folder todo_folder note todo_note
	end tell
end run

on index_of_folder(this_name, folder_list)
	repeat with i from 1 to the count of folder_list
		if name of item i of folder_list is this_name then return i
	end repeat
	
	return -1
end index_of_folder

on pos_of_text(this_text, this_list)
	repeat with i from 1 to the count of this_list
		if text of item i of this_list starts with this_text then return i
	end repeat
	
	return -1
end pos_of_text
