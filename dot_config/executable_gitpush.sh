#!/bin/bash

# Navigate to the current directory where the script is run
# (This is already the default behavior, so no need to cd)

# Stage all changes
git add .

# Commit with current date and time as message
git commit -m "$(date '+%Y-%m-%d %H:%M:%S')"

# Push to the current branch
git push
