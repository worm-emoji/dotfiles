# Keyboard Shortcuts Reference

## TMUX (Prefix: `Ctrl+b`)

### Session Management
| Shortcut | Action |
|----------|--------|
| `Ctrl+b d` | Detach from session |
| `Ctrl+b s` | List sessions |
| `Ctrl+b $` | Rename session |
| `Ctrl+b (` | Previous session |
| `Ctrl+b )` | Next session |

### Window Management
| Shortcut | Action |
|----------|--------|
| `Ctrl+b c` | Create new window |
| `Ctrl+b ,` | Rename window |
| `Ctrl+b &` | Kill window |
| `Ctrl+b n` | Next window |
| `Ctrl+b p` | Previous window |
| `Ctrl+b 0-9` | Switch to window # |
| `Ctrl+b w` | List windows |

### Pane Management
| Shortcut | Action |
|----------|--------|
| `Ctrl+b %` | Split vertically |
| `Ctrl+b "` | Split horizontally |
| `Ctrl+b x` | Kill pane |
| `Ctrl+b z` | Toggle pane zoom |
| `Ctrl+b {` | Move pane left |
| `Ctrl+b }` | Move pane right |
| `Ctrl+b o` | Next pane |
| `Ctrl+b ;` | Last active pane |
| `Ctrl+b Space` | Toggle pane layouts |
| `Ctrl+b Arrow` | Resize pane |

### Copy Mode (vi keys enabled)
| Shortcut | Action |
|----------|--------|
| `Ctrl+b [` | Enter copy mode |
| `v` | Begin selection |
| `y` | Copy selection |
| `q` | Exit copy mode |

---

## NEOVIM (Leader: `Space`)

### General
| Shortcut | Action |
|----------|--------|
| `jk` | Exit insert mode |
| `Esc` | Clear search highlight |
| `Space w` | Save file |
| `F5` | Trim trailing whitespace |

### Window Navigation
| Shortcut | Action |
|----------|--------|
| `Ctrl+h` | Move to left window |
| `Ctrl+j` | Move to lower window |
| `Ctrl+k` | Move to upper window |
| `Ctrl+l` | Move to right window |
| `Ctrl+Up` | Increase window height |
| `Ctrl+Down` | Decrease window height |
| `Ctrl+Left` | Decrease window width |
| `Ctrl+Right` | Increase window width |

### Scrolling & Movement
| Shortcut | Action |
|----------|--------|
| `Ctrl+d` | Scroll down (centered) |
| `Ctrl+u` | Scroll up (centered) |
| `n` | Next search (centered) |
| `N` | Prev search (centered) |

### Editing
| Shortcut | Action |
|----------|--------|
| `J` (visual) | Move line down |
| `K` (visual) | Move line up |
| `Space p` (visual) | Paste without overwriting register |
| `Space d` | Delete to void register |

### Telescope (Fuzzy Finder)
| Shortcut | Action |
|----------|--------|
| `Space f` | Find files |
| `Space h` | Find files (hidden) |
| `Space r` | Live grep |
| `Space b` | Buffers |
| `Space /` | Search in buffer |
| `Space gc` | Git commits |
| `Space gs` | Git status |
| `Space gf` | Git files |
| `Ctrl+j/k` | Navigate results |
| `Ctrl+q` | Send to quickfix |

### LSP (Language Server)
| Shortcut | Action |
|----------|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `Space ca` | Code action |
| `Space rn` | Rename symbol |
| `Space D` | Type definition |
| `Space ds` | Document symbols |
| `Space ws` | Workspace symbols |

### Diagnostics
| Shortcut | Action |
|----------|--------|
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `Space e` | Show diagnostic float |
| `Space xx` | Toggle trouble |
| `Space xw` | Workspace diagnostics |
| `Space xd` | Document diagnostics |
| `Space xq` | Quickfix |

### Quickfix
| Shortcut | Action |
|----------|--------|
| `[q` | Previous quickfix |
| `]q` | Next quickfix |

### Neo-tree (File Explorer)
| Shortcut | Action |
|----------|--------|
| `Space n` | Toggle Neo-tree |
| `Space N` | Reveal in Neo-tree |
| `Enter/o` | Open file |
| `s` | Open split |
| `v` | Open vsplit |
| `t` | Open in tab |
| `a` | Add file/folder |
| `d` | Delete |
| `r` | Rename |
| `c` | Copy |
| `m` | Move |
| `R` | Refresh |
| `?` | Show help |

### Git (Gitsigns)
| Shortcut | Action |
|----------|--------|
| `]h` | Next hunk |
| `[h` | Previous hunk |
| `Space hs` | Stage hunk |
| `Space hr` | Reset hunk |
| `Space hS` | Stage buffer |
| `Space hu` | Undo stage hunk |
| `Space hR` | Reset buffer |
| `Space hp` | Preview hunk |
| `Space hb` | Blame line (full) |
| `Space hd` | Diff this |

### Git (Fugitive)
| Shortcut | Action |
|----------|--------|
| `Space gg` | Git status |
| `Space gb` | Git blame |
| `Space gy` | Copy GitHub URL |

### Surround (mini.surround)
| Shortcut | Action |
|----------|--------|
| `sa` | Add surround |
| `sd` | Delete surround |
| `sr` | Replace surround |
| `sf` | Find surround |
| `sh` | Highlight surround |

### Comments
| Shortcut | Action |
|----------|--------|
| `gcc` | Toggle line comment |
| `gc` (visual) | Toggle comment |
| `gbc` | Toggle block comment |

### Completion (Insert Mode)
| Shortcut | Action |
|----------|--------|
| `Ctrl+Space` | Trigger completion |
| `Tab` | Next item / expand snippet |
| `Shift+Tab` | Previous item |
| `Enter` | Confirm selection |
| `Ctrl+e` | Abort completion |
| `Ctrl+b` | Scroll docs up |
| `Ctrl+f` | Scroll docs down |

### Buffers
| Shortcut | Action |
|----------|--------|
| `Space bd` | Delete buffer |
| `Space bD` | Delete buffer (force) |

### Misc
| Shortcut | Action |
|----------|--------|
| `Space st` | Search TODOs |

---

## VIM ESSENTIALS

### Modes
| Key | Mode |
|-----|------|
| `i` | Insert mode |
| `v` | Visual mode |
| `V` | Visual line mode |
| `Ctrl+v` | Visual block mode |
| `Esc` | Normal mode |
| `:` | Command mode |

### Motion
| Key | Action |
|-----|--------|
| `h/j/k/l` | Left/Down/Up/Right |
| `w/b` | Next/prev word |
| `e` | End of word |
| `0/$` | Start/end of line |
| `^` | First non-blank |
| `gg/G` | Start/end of file |
| `{/}` | Prev/next paragraph |
| `%` | Matching bracket |
| `f{char}` | Jump to char |
| `t{char}` | Jump before char |

### Editing
| Key | Action |
|-----|--------|
| `dd` | Delete line |
| `yy` | Yank line |
| `p/P` | Paste after/before |
| `u` | Undo |
| `Ctrl+r` | Redo |
| `ci{` | Change inside {} |
| `di"` | Delete inside "" |
| `ya(` | Yank around () |
| `.` | Repeat last change |
| `>>` / `<<` | Indent / Outdent |

### Search
| Key | Action |
|-----|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `*` | Search word under cursor |
| `n/N` | Next/prev match |

### Splits
| Key | Action |
|-----|--------|
| `:sp` | Horizontal split |
| `:vsp` | Vertical split |
| `:q` | Close window |
| `:qa` | Close all |
| `:w` | Save |
| `:wq` | Save and quit |
