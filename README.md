# Automated Issue Tracker & Chronological Reporter

This repository provides a **GitHub Action workflow and Python script** that automate issue management by:

- **Labeling GitHub issues** as `fixed` or `unfixed` based on linked merged pull requests  
- **Sorting all issues chronologically** from oldest to newest  
- **Generating a Markdown report** (`ISSUES_CHRONOLOGICAL.md`) listing all issues with their status and creation date  

This helps contributors **prioritize the oldest open issues**, streamlining project progress and avoiding duplicated efforts on already fixed issues.

---

## Features

- Automatically detects if an issue is fixed by checking linked merged PRs  
- Labels issues as `fixed` or `unfixed` accordingly  
- Closes fixed issues optionally (configurable)  
- Generates a neatly formatted Markdown file with a chronological list of all issues  
- Scheduled to run daily or triggered manually via GitHub Actions  

---

## Setup

1. **Create `fixed` and `unfixed` labels** in your repository Issues tab.  
2. Add the Python script in `.github/scripts/generate_issues_md.py`.  
3. Add the GitHub Action workflow in `.github/workflows/generate_issues_list.yml`.  
4. Make sure your repo’s GitHub Actions have permission to push commits.  
5. Optionally customize the schedule or script as needed.

---

## Usage

- The workflow runs automatically on schedule or can be triggered manually.  
- After running, check the root of your repo for the `ISSUES_CHRONOLOGICAL.md` file.  
- Use this file to view all issues sorted by creation date, with clear fixed/unfixed labels.  
- Contributors can focus on the oldest `unfixed` issues first.

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Contributing

Contributions, issues, and feature requests are welcome! Please open issues or pull requests for any improvements.
