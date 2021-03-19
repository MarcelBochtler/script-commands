#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Search port
# @raycast.mode fullOutput
# @raycast.packageName MacPorts
#
# Optional parameters:
# @raycast.icon images/macports.png
# @raycast.needsConfirmation false
# @raycast.argument1 {"type": "text", "placeholder": "Package name"}
#
# Documentation:
# @raycast.description Search for a MacPorts port.
# @raycast.author Marcel Bochtler
# @raycast.authorURL https://github.com/MarcelBochtler

PORT=/opt/local/bin/port

if ! command -v $PORT &> /dev/null; then
  echo "port command is required (https://macports.org).";
  exit 1;
fi

$PORT search $1
