# Agentic Dev Environment Cheat Sheet

## Graphite
| Command | Action |
|---|---|
| `gs` | `gt sync --force` — sync with remote |
| `gss` | `gt submit --stack` — submit PR stack |
| `gls` | `gt ls` — list branches |
| `gt create -am "msg"` | Create branch + commit |
| `gt modify -am "msg"` | Amend current branch |
| `gt restack` | Rebase stack (never use git rebase) |

## Neovim — Navigation
| Keys | Action |
|---|---|
| `<leader>sf` | Search files (telescope) |
| `<leader>sg` | Search by grep |
| `<leader>sw` | Search current word |
| `<leader><leader>` | Find open buffers |
| `<leader>/` | Fuzzy search in current buffer |
| `<leader>a` | Harpoon: add file |
| `Ctrl-e` | Harpoon: toggle menu |
| `<leader>1-4` | Harpoon: jump to file 1-4 |
| `-` | Oil: open parent directory |
| `s` | Flash: jump to any word |
| `S` | Flash: treesitter jump |

## Neovim — Git
| Keys | Action |
|---|---|
| `<leader>gw` | List/switch worktrees |
| `<leader>gc` | Create worktree |
| `<leader>gd` | Diffview open |
| `<leader>gh` | File history |
| `<leader>gH` | Branch history |
| `<leader>gg` | Lazygit (via snacks) |
| `]h` / `[h` | Next/prev git hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |

## Neovim — LSP
| Keys | Action |
|---|---|
| `grd` | Go to definition |
| `grr` | Find references |
| `gri` | Go to implementation |
| `grn` | Rename symbol |
| `gra` | Code action |
| `gO` | Document symbols |
| `gW` | Workspace symbols |
| `<leader>th` | Toggle inlay hints |
| `<leader>f` | Format buffer |

## Neovim — Diagnostics
| Keys | Action |
|---|---|
| `<leader>xx` | Toggle diagnostics list |
| `<leader>xX` | Buffer diagnostics only |
| `<leader>cs` | Symbols list |
| `<leader>cl` | LSP references |
| `<leader>q` | Quickfix list |

## Neovim — Editing
| Keys | Action |
|---|---|
| `af/if` | Select around/inside function |
| `ac/ic` | Select around/inside class |
| `aa/ia` | Select around/inside parameter |
| `]m` / `[m` | Jump to next/prev function |
| `]]` / `[[` | Jump to next/prev class |
| `<leader>ps` | Swap parameter forward |
| `saiw"` | Surround word with quotes |
| `sd'` | Delete surrounding quotes |
| `sr)"` | Replace surrounding ) with " |

## Neovim — UI (Snacks)
| Keys | Action |
|---|---|
| `<leader>tt` | Toggle terminal |
| `<leader>n` | Notification history |

## Tree (Worktree + Agent Workflow)
| Command | Action |
|---|---|
| `tree new <task> [claude\|codex]` | Create worktree + Graphite branch + cmux workspace + agent |
| `tree ls` | List worktrees with Graphite status |
| `tree rm <task>` | Remove worktree + branch |
| `tree go [task]` | cd into worktree (fzf picker if no arg) |
| `tree sync` | `gt sync --force` from main checkout |
| `tree submit [--stack]` | `gt submit` current branch or stack |

**Abbreviations:** `tn` `tl` `tr` `tg` `ts` `tp` `tps`

## Shell Aliases
| Alias | Expands to |
|---|---|
| `nv` | `nvim` |
| `cat` | `bat` (syntax highlighting) |
| `ls` | `eza` |
| `ll` | `eza -la --git` |
| `etree` | `eza --tree` |
| `lg` | `lazygit` |
| `z <dir>` | zoxide (smart cd) |

## Dotfiles (chezmoi)
| Command | Action |
|---|---|
| `dots "msg"` | Re-add, commit, push dotfiles |
| `dots-pull` | Pull latest dotfiles from remote |
| `chezmoi managed` | List all tracked files |
| `chezmoi diff` | Show pending changes |
| `chezmoi re-add` | Sync edited files into chezmoi source |
| `chezmoi cd` | cd into chezmoi source repo |

**Abbreviations:** `ds` `dp`

**New machine setup:** `sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply <github-username>`

## Git
- `git diff` and `git log -p` use **delta** (side-by-side, syntax-highlighted)
- `git diff` navigation: `n`/`N` to jump between files
