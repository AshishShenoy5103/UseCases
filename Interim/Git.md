# 📘 Commonly Used Git Commands & Interview Questions

This document covers frequently asked Git interview questions along with commonly used Git commands for day-to-day development work.

---

## 🔁 Git Flow Diagram

![Git Flow](/Interim/git.png)

---

## ✅ Common Git Commands

| Task | Command |
|------|---------|
| Initialize a new repository | `git init` |
| Clone an existing repository | `git clone <repository-url>` |
| Add a specific file to staging | `git add <filename>` |
| Add all changes to staging | `git add .` |
| Commit with a message | `git commit -m "your message"` |
| Push changes to remote | `git push` |
| Push to a specific branch | `git push origin <branch-name>` |
| Pull latest changes | `git pull` |
| Create a new branch | `git branch <branch-name>` |
| Switch branches | `git checkout <branch-name>` or `git switch <branch-name>` |
| Check status of working directory | `git status` |
| View commit history | `git log` |
| Merge branches | `git merge <branch-name>` |
| Rebase current branch | `git rebase <branch-name>` |

---

## 🧠 Git Interview Questions and Answers

1. **Which command is used to initialize a new Git repository?**  
   `git init`

2. **Which command is used to clone an existing repository?**  
   `git clone <repository-url>`

3. **Which command is used to add files to the staging area?**  
   `git add <filename>` or `git add .`

4. **Which command is used to commit changes with a message?**  
   `git commit -m "commit message"`

5. **Which command is used to push changes to a remote repository?**  
   `git push`

6. **Which command is used to pull changes from a remote repository?**  
   `git pull`

7. **Which command is used to create a new branch?**  
   `git branch <branch-name>`

8. **Which command is used to switch between branches?**  
   `git checkout <branch-name>` or `git switch <branch-name>`

9. **Which command is used to check the status of your working directory?**  
   `git status`

10. **Which command is used to view commit history?**  
    `git log`

11. **What is Git rebase?**  
    Rebasing moves your branch’s commits to a new base commit, creating a cleaner and linear history.

12. **What is a merge conflict and how do you resolve it?**  
    A conflict occurs when Git cannot auto-merge changes.  
    - Open the file with conflict  
    - Look for `<<<<<<<`, `=======`, `>>>>>>>`  
    - Edit the file, keep the correct code  
    - Remove the conflict markers  
    - Run `git add` and `git commit`

13. **What is the difference between `git merge` and `git pull`?**  
    - `git merge`: Merges another branch into your current branch  
    - `git pull`: Fetches and merges from the remote repository

14. **What happens internally when you run `git pull`?**  
    - Fetches latest changes  
    - Merges them into your local branch

15. **You made changes but forgot to stage them. What now?**  
    Run: `git add <filename>`

16. **Switch to a branch named `feature-login`:**  
    Run: `git checkout feature-login` or `git switch feature-login`

17. **Update your local repo if it's behind:**  
    Run: `git pull`

18. **Push committed changes to GitHub (main branch):**  
    Run: `git push origin main`

19. **Merge feature branch into main:**  
    ```bash
    git checkout main
    git merge feature-branch
    ```

20. **Keep a clean, linear history (avoid merge commits):**  
    ```bash
    git checkout feature
    git rebase main
    ```

---

## 🧰 Pro Tips

- Use `git log --oneline --graph` to view a visual commit history.
- Use `git stash` to temporarily save changes.
- Use `.gitignore` to exclude files/folders from version control.
- Use `git diff` to see unstaged changes.

---

