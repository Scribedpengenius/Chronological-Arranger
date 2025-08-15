#!/bin/bash

# Create main folder and src folder
mkdir -p Chronological-Arranger/src
cd Chronological-Arranger || exit

# README.md
cat <<EOL > README.md
# Chronological Arranger

Automatically prioritizes unfixed issues and arranges all GitHub issues chronologically for efficient workflow.

## Features
- Detects fixed vs. unfixed issues
- Orders issues from oldest to newest
- Reduces contributor confusion

## One-Click Installation

You can install this action from the [GitHub Marketplace](https://github.com/marketplace) once approved.

## Usage

\`\`\`yaml
uses: Scribedpengenius/Chronological-Arranger@v1
with:
  repo-token: \${{ github.token }}
\`\`\`
EOL

# .gitignore
cat <<EOL > .gitignore
node_modules/
dist/
.env
EOL

# action.yml
cat <<EOL > action.yml
name: "Chronological Arranger"
description: "Automatically arranges GitHub issues chronologically and prioritizes unfixed items."
author: "Sean Drew"
runs:
  using: "node16"
  main: "src/index.js"
branding:
  icon: "calendar"
  color: "blue"
inputs:
  repo-token:
    description: "GitHub token to access repository issues"
    required: true
    default: "\${{ github.token }}"
EOL

# marketplace-metadata.json
cat <<EOL > marketplace-metadata.json
{
  "name": "Chronological Arranger",
  "description": "Arranges GitHub issues from oldest to newest, prioritizing unfixed issues for efficient workflow.",
  "categories": ["Code quality", "Project management"],
  "pricing": "free",
  "visibility": "public"
}
EOL

# package.json
cat <<EOL > package.json
{
  "name": "chronological-arranger",
  "version": "1.0.0",
  "description": "GitHub Action to arrange issues chronologically and prioritize unfixed issues.",
  "main": "src/index.js",
  "scripts": {
    "start": "node src/index.js"
  },
  "author": "Sean Drew",
  "license": "MIT",
  "dependencies": {
    "@octokit/rest": "^19.0.7"
  }
}
EOL

# src/index.js
cat <<EOL > src/index.js
const core = require('@actions/core');
const github = require('@actions/github');

async function run() {
  try {
    const token = core.getInput('repo-token');
    const octokit = github.getOctokit(token);
    const { owner, repo } = github.context.repo;

    const issues = await octokit.rest.issues.listForRepo({
      owner,
      repo,
      state: 'open'
    });

    const sortedIssues = issues.data
      .filter(issue => !issue.pull_request) // Ignore PRs
      .sort((a, b) => new Date(a.created_at) - new Date(b.created_at));

    console.log('Sorted Issues:');
    sortedIssues.forEach(issue => {
      console.log(\`#\${issue.number}: \${issue.title}\`);
    });

  } catch (error) {
    core.setFailed(error.message);
  }
}

run();
EOL

echo "Chronological-Arranger setup complete!"
