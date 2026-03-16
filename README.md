# dotfiles

Managed with [chezmoi](https://www.chezmoi.io/).

## What's in here

- **fish shell** — config, functions, conf.d (includes `tree` agent workflow functions)
- **neovim** — lazy.nvim, catppuccin-mocha, sourcekit-lsp, lua_ls
- **agentic-setup** — CLAUDE.md/AGENTS.md templates, cheatsheet, choices.json
- **gitignore_global** — global git ignores

## Setup on a new machine

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply reftonull
```

## Update after changes

```sh
dots "description of change"
```

## Pull updates on another machine

```sh
dots-pull
```
