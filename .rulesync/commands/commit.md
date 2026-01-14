---
targets:
  - '*'
description: ''
---
Your job is to create a commit using Conventional Commits format.

First, review the staged changes with `git status` and `git diff --cached` to understand what was changed.

Then create a commit message following this format:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

**Commit Types:**

- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation only changes
- `style`: Changes that do not affect the meaning of the code (formatting, missing semicolons, etc.)
- `refactor`: A code change that neither fixes a bug nor adds a feature
- `perf`: A code change that improves performance
- `test`: Adding missing tests or correcting existing tests
- `chore`: Changes to the build process or auxiliary tools and libraries (e.g., dotfiles, config files)
- `ci`: Changes to CI configuration files and scripts

**Guidelines:**

- Use lowercase for the type
- Use imperative mood in the description ("add" not "added" or "adds")
- Keep the description concise (50-72 characters recommended)
- Add a body if more explanation is needed (separated by blank line)
- Use the body to explain _what_ and _why_ vs. _how_
- Reference issues/PRs in the footer if applicable

**Examples:**

- `chore: add .gitignore to exclude system files`
- `refactor(install): improve error handling and add stow check`
- `feat(zsh): add new aliases for development workflow`

After creating the commit message, execute: `git commit -m "<message>"`
