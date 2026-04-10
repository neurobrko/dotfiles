---
description: Create a comprehensive PR message for the current branch
---
Analyze all changes on the current branch compared to the base branch:

1. Determine the base branch (usually `main` or `master`):
   !`git remote show origin 2>/dev/null | grep 'HEAD branch' | awk '{print $NF}'`

2. Review the full diff and commit history against the base branch using:
   - `git log <base>..HEAD --oneline`
   - `git diff <base>...HEAD`

3. Create a comprehensive PR message with:
   - **Title**: concise summary of the change (under 72 characters)
   - **Summary**: 2-4 bullet points covering what changed and why
   - **Changes**: list of notable changes grouped by area (e.g. backend, frontend, config)
   - **Testing**: how to verify the changes (if applicable)

4. Output the formatted PR message so I can review it. Ask for confirmation before creating the PR with `gh pr create`.
