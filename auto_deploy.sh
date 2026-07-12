#!/bin/bash
echo "Starting automated deployment..."

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Error: Not in a git repository"
    exit 1
fi

# Add all changes
echo "Adding all changes..."
git add .

# Check if there are changes to commit
if git diff-index --quiet HEAD --; then
    echo "No changes to commit"
    exit 0
fi

# Commit with timestamp
echo "Committing changes..."
git commit -m "Automated update $(date '+%Y-%m-%d %H:%M:%S')"

# Push to remote
echo "Pushing to GitHub..."
git push origin main

echo "Deployment complete!"