# ── Environment ──────────────────────────────────────────────────────────────
set -gx EDITOR nvim

# ── PATH ─────────────────────────────────────────────────────────────────────
fish_add_path ~/.local/bin

# ── Aliases ──────────────────────────────────────────────────────────────────
alias nv="nvim"
alias gs="gt sync --force"
alias gss="gt submit --stack"
alias gls="gt ls"
alias cat="bat"
alias ls="eza"
alias ll="eza -la --git"
alias etree="eza --tree"
alias lg="lazygit"

# ── Integrations ─────────────────────────────────────────────────────────────
# zoxide (smart cd)
zoxide init fish --cmd cd | source
alias z="cd"

# OrbStack
source ~/.orbstack/shell/init2.fish 2>/dev/null; or true
