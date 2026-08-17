# CLAUDE.md

## Docs

- Wrap all lines to a maximum of 80 columns.

## Commits

If the commit title alone doesn't make the domain obvious (e.g. "Update
settings.json" doesn't say which tool), name it in the title for
context (e.g. "claudecode.nvim", "neovim", "alacritty"). Skip this when
the filename already identifies the domain unambiguously (e.g.
`lazy-lock.json` is unmistakably neovim's).

### Format

Weave the domain into the sentence rather than prefixing it, e.g.:

- "✨ Add lazygit.nvim floating window plugin"
- "🎨 Reformat claudecode.nvim autocmds"
- "✨ Send CSI-u sequences for Ctrl+0-9 in alacritty"
- not "✨ alacritty: Send CSI-u sequences for Ctrl+0-9".
