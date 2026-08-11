# Neovim cheatsheet

`<leader>` is <kbd>Space</kbd> · `<localleader>` is <kbd>\</kbd> · Neovim 0.12 · 32 plugins

Generated from a live dump of the running config. Keys marked **(nvim)** are Neovim 0.12
built-ins, not config additions. Keys marked **(buf)** exist only where an LSP or git repo is
attached.

---

## Read this first — keys that shadow vanilla Vim

| Key | Now does | Vanilla equivalent |
| --- | --- | --- |
| `s` | Flash jump (n/x/o) | `cl` to substitute a char |
| `S` | Flash treesitter select | `cc` to substitute a line |
| `r` | Remote flash — **operator-pending only** (`dr`, `yr`) | normal-mode `r` is untouched |
| `]t` `[t` | Next / prev todo comment | tags moved to `]T` `[T` |
| `gs` | Surround prefix (moved off `s` for flash) | — |
| `<Tab>` | normal: apply AI next-edit · insert: snippet jump | — |

---

## Leader groups

| Prefix | Group | Prefix | Group |
| --- | --- | --- | --- |
| `<leader>a` | ai | `<leader>s` | search |
| `<leader>b` | buffer | `<leader>t` | tab |
| `<leader>c` | code | `<leader>u` | ui / toggle |
| `<leader>f` | find | `<leader>w` | window |
| `<leader>g` | git | `<leader>x` | trouble |
| `<leader>gh` | hunk (buf) | `gs` | surround |
| | | `gr` | lsp (nvim) |

### Top level

| Key | Action |
| --- | --- |
| `<leader><Space>` | Smart find files |
| `<leader>/` | Grep |
| `<leader>,` | Buffers |
| `<leader>e` | File explorer |
| `<leader>n` | Notification history |
| `<leader>?` | Buffer-local keymaps (which-key) |
| `-` | Oil — edit parent directory as a buffer |
| `<leader>-` | Oil in a float |

---

## Find — `<leader>f`

| Key | Action |
| --- | --- |
| `ff` | Find files |
| `fb` | Buffers |
| `fr` | Recent files |
| `fg` | Find git files |
| `fp` | Projects |
| `fc` | Find config file |

## Search — `<leader>s`

| Key | Action | Key | Action |
| --- | --- | --- | --- |
| `sg` | Grep | `sm` | Marks |
| `sw` | Grep word (n/x) | `sj` | Jumps |
| `sl` | Buffer lines | `sq` | Quickfix list |
| `sh` | Help pages | `su` | Undo history |
| `sk` | Keymaps | `sR` | Registers |
| `sd` | Diagnostics | `sc` | Command history |
| `sD` | Buffer diagnostics | `si` | Icons |
| `ss` | LSP symbols | `st` | Todo comments |
| `sS` | LSP workspace symbols | `sT` | Todo / Fix / Fixme |
| `sr` | Resume last picker | | |

---

## LSP & code

Most of these ship with Neovim 0.12 — no plugin involved.

| Key | Action | |
| --- | --- | --- |
| `grn` | Rename | (nvim) |
| `gra` | Code action (n/v) | (nvim) |
| `grr` | References | (nvim) |
| `gri` | Implementation | (nvim) |
| `grt` | Type definition | (nvim) |
| `grx` | Run codelens | (nvim) |
| `gO` | Document symbols | (nvim) |
| `K` | Hover | (nvim) |
| `<C-s>` | Signature help (insert) | (nvim) |
| `<C-w>d` | Show diagnostic under cursor | (nvim) |
| `gd` | Goto definition | (buf) |
| `gD` | Goto declaration | (buf) |
| `<leader>cf` | Format buffer / selection (n/v) | |

### Trouble — `<leader>x`

| Key | Action |
| --- | --- |
| `xx` | Diagnostics |
| `xX` | Buffer diagnostics |
| `xs` | Symbols outline |
| `xl` | LSP references / definitions |
| `xL` | Location list |
| `xq` | Quickfix list |
| `xt` | Todo comments |

---

## Git — `<leader>g`

| Key | Action |
| --- | --- |
| `gg` | Lazygit |
| `gl` | Git log |
| `gL` | Git log (current line) |
| `gs` | Git status |
| `gb` | Git branches |
| `gB` | Open line on GitHub (n/x) |

### Hunks — `<leader>gh` (buf)

| Key | Action | Key | Action |
| --- | --- | --- | --- |
| `ghs` | Stage / unstage hunk (n/v) | `ghb` | Blame line |
| `ghr` | Reset hunk (n/v) | `ghB` | Toggle inline blame |
| `ghS` | Stage buffer | `ghd` | Diff this |
| `ghR` | Reset buffer | `ghD` | Diff against `~` |
| `ghp` | Preview hunk inline | | |

`ghs` toggles — run it on a staged sign to unstage.

---

## Buffers, windows, tabs

| Key | Action | Key | Action |
| --- | --- | --- | --- |
| `<leader>bb` | Switch to other buffer | `<leader>wv` | Split vertically |
| `<leader>bd` | Delete buffer (keeps layout) | `<leader>wh` | Split horizontally |
| `[b` `]b` | Prev / next buffer | `<leader>we` | Equalize splits |
| `[B` `]B` | Move buffer left / right | `<leader>wx` | Close split |
| `<C-h/j/k/l>` | Move between windows | | |

| Key | Action |
| --- | --- |
| `<leader>to` | New tab |
| `<leader>tx` | Close tab |
| `<leader>tn` `<leader>tp` | Next / prev tab |
| `<leader>tf` | Current buffer in a new tab |

---

## Motions & text objects

### Flash

| Key | Action |
| --- | --- |
| `s` | Jump anywhere (n/x/o) |
| `S` | Treesitter node select (n/x/o) |
| `r` | Remote — operate at a distance (`dr`, `yr`) |
| `R` | Treesitter search (o/x) |
| `<C-s>` | Toggle flash in `/` search |

### Text objects — `a` around, `i` inside

| Object | Selects | Object | Selects |
| --- | --- | --- | --- |
| `af` `if` | Function (treesitter) | `aq` `iq` | Quotes |
| `ac` `ic` | Class (treesitter) | `aa` `ia` | Argument |
| `ao` `io` | Block / conditional / loop | `at` `it` | HTML tag |
| `au` `iu` | Function **call** | `ad` `id` | Digits |
| `ab` `ib` | Any bracket | `a?` `i?` | Prompt for pair |

Suffixes: `al` / `an` target the **last** / **next** object — `dan(` deletes the next parens.
`ci(` works from outside the parens.

### Surround — `gs`

| Key | Action |
| --- | --- |
| `gsa` | Add — `gsaiw"` wraps a word |
| `gsd` | Delete — `gsd"` |
| `gsr` | Replace — `gsr"'` |
| `gsf` `gsF` | Find right / left |
| `gsh` | Highlight surrounding |

Suffix `n` / `l` for next / last: `gsdn"` deletes the next quotes.

### Comment (nvim)

`gcc` line · `gc` + motion · `gc` in visual

---

## Navigation pairs

| Pair | Jumps between | |
| --- | --- | --- |
| `]h` `[h` | Git hunks | (buf) |
| `]t` `[t` | Todo comments | |
| `]d` `[d` | Diagnostics | (nvim) |
| `]D` `[D` | First / last diagnostic | (nvim) |
| `]b` `[b` | Buffers (bufferline order) | |
| `]B` `[B` | Move buffer | |
| `]]` `[[` | LSP references of word under cursor | |
| `]i` `[i` | Scope edges (operator-pending) | |
| `]q` `[q` | Quickfix | (nvim) |
| `]l` `[l` | Location list | (nvim) |
| `]a` `[a` | Arglist | (nvim) |
| `]T` `[T` | Tags | (nvim) |

---

## Editing

| Key | Action |
| --- | --- |
| `jk` | Exit insert mode |
| `<Esc>` | Clear search highlight |
| `n` `N` | Next / prev match, centred |
| `<C-d>` `<C-u>` | Half page down / up, centred |
| `<M-j>` `<M-k>` | Move line down / up |
| `J` `K` *(visual)* | Move selection down / up |
| `<` `>` *(visual)* | Indent, keeping the selection |
| `p` *(visual)* | Paste without clobbering the register |

---

## Completion & AI

### blink.cmp

| Key | Action |
| --- | --- |
| `<C-y>` | Accept |
| `<C-n>` `<C-p>` | Next / prev item |
| `<C-Space>` | Open menu, then docs |
| `<C-e>` | Dismiss |
| `<C-k>` | Toggle signature help |
| `<Tab>` `<S-Tab>` | Jump between snippet stops |

### Copilot (insert)

| Key | Action |
| --- | --- |
| `<M-l>` | Accept suggestion |
| `<M-]>` `<M-[>` | Next / prev suggestion |
| `<C-]>` | Dismiss |

### sidekick

| Key | Action |
| --- | --- |
| `<Tab>` | Go to / apply next-edit suggestion (normal) |
| `<leader>aa` | Toggle AI CLI (n/v) |
| `<leader>ac` | Claude |
| `<leader>ap` | Prompt picker (n/v) |
| `<leader>as` | Select CLI |
| `<C-.>` | Focus the CLI (n/x/i/t) |

---

## UI toggles — `<leader>u`

| Key | Action |
| --- | --- |
| `uc` | Pick colorscheme (live preview, persists) |
| `ud` | Diagnostics: end-of-line text ⇄ full lines |
| `uf` | Format on save |
| `uh` | Inlay hints (buf) |
| `uz` | Zen mode |
| `uZ` | Zoom current window |

---

## Plugins

**Core** — lazy.nvim (manager) · plenary.nvim (library)

**Editor UI** — snacks.nvim (picker, explorer, dashboard, notifier, input, indent, statuscolumn,
lazygit, zen, scroll) · lualine.nvim (statusline) · incline.nvim (floating filename per window) ·
bufferline.nvim (buffer tabs) · which-key.nvim (keymap menu) · mini.icons (icons)

**Colorschemes** — kanagawa *(active)* · catppuccin · rose-pine · everforest · nord.nvim

**LSP** — nvim-lspconfig (server definitions) · mason.nvim (installs servers) · lazydev.nvim
(Neovim API types for Lua)

**Completion** — blink.cmp · friendly-snippets

**Treesitter** — nvim-treesitter (parsers) · nvim-treesitter-textobjects (queries for `af`/`ac`) ·
nvim-ts-autotag (close & rename JSX/HTML tags)

**Editing** — mini.ai (text objects) · mini.surround · mini.pairs · flash.nvim (motion)

**Tooling** — conform.nvim (format on save) · gitsigns.nvim · trouble.nvim (diagnostic lists) ·
todo-comments.nvim · oil.nvim (filesystem as a buffer)

**AI** — copilot.lua (ghost text) · sidekick.nvim (next-edit suggestions + CLI bridge)

---

## Language servers

`lua_ls` · `vtsls` · `gopls` · `astro` · `tailwindcss` · `eslint` · `html` · `cssls` · `jsonls` ·
`yamlls` · `emmet_language_server` · `copilot`

Formatters: `stylua` (Lua) · `prettierd` → `prettier` (web) · Go formats via `gopls` with
`gofumpt = true`.
