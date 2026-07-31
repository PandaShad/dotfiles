local M = {}

M.default = "kanagawa-wave"

M.themes = {
  "kanagawa-wave",
  "kanagawa-dragon",
  "kanagawa-lotus",
  "catppuccin-mocha",
  "catppuccin-macchiato",
  "catppuccin-frappe",
  "catppuccin-latte",
  "rose-pine-main",
  "rose-pine-moon",
  "rose-pine-dawn",
  "everforest",
  "nord",
}

local statefile = vim.fs.joinpath(vim.fn.stdpath("state"), "theme.txt")

---Read the persisted theme name, or nil if there isn't a valid one.
---@return string?
local function read()
  local ok, lines = pcall(vim.fn.readfile, statefile)
  local name = ok and lines and vim.trim(lines[1] or "") or ""
  -- Deliberately not checked against M.themes: the snacks colorschemes picker
  -- offers every scheme on the runtimepath, so a valid choice can legitimately
  -- be outside that curated list. apply() pcall-falls back if it won't load.
  return name ~= "" and name or nil
end

-- The variant actually selected. `vim.g.colors_name` is lossy: every
-- kanagawa-* variant reports plain "kanagawa", so it can't drive the UI marker.
M.current = nil

---Apply a colorscheme, optionally remembering it for next launch.
---@param name string
---@param persist? boolean
function M.set(name, persist)
  local ok, err = pcall(vim.cmd.colorscheme, name)
  if not ok then
    vim.notify(("Could not load colorscheme %q: %s"):format(name, err), vim.log.levels.WARN)
    return false
  end
  M.current = name
  if persist ~= false then
    pcall(vim.fn.writefile, { name }, statefile)
  end
  return true
end

---Apply the persisted theme, falling back to the default then to a builtin.
function M.apply()
  local name = read() or M.default
  if not M.set(name, false) and name ~= M.default then
    M.set(M.default, false)
  end
end

---Choose a theme interactively. Persists the choice.
function M.pick()
  local ok, snacks = pcall(require, "snacks")
  if ok and snacks.picker then
    return snacks.picker.colorschemes({
      confirm = function(picker, item)
        picker:close()
        if item then
          picker.preview.state.colorscheme = nil
          vim.schedule(function()
            M.set(item.text)
          end)
        end
      end,
    })
  end

  -- Fallback for when snacks isn't available: the curated list, no preview.
  vim.ui.select(M.themes, {
    prompt = "Colorscheme",
    format_item = function(item)
      return item == M.current and item .. "  (current)" or item
    end,
  }, function(choice)
    if choice then
      M.set(choice)
    end
  end)
end

function M.setup()
  vim.api.nvim_create_user_command("Theme", function(cmd)
    if cmd.args == "" then
      M.pick()
    else
      M.set(cmd.args)
    end
  end, {
    nargs = "?",
    desc = "Set or pick the colorscheme (persists)",
    complete = function(lead)
      return vim.tbl_filter(function(t)
        return t:find(lead, 1, true) == 1
      end, M.themes)
    end,
  })

  vim.keymap.set("n", "<leader>uc", M.pick, { desc = "Pick colorscheme" })

  M.apply()
end

return M
