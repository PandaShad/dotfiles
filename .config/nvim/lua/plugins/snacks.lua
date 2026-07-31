return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true }, -- disable heavy features on huge files
        quickfile = { enabled = true }, -- render the file before plugins load
        input = { enabled = true }, -- vim.ui.input in a themed float
        notifier = { timeout = 3000, style = "compact" },
        scope = { enabled = true }, -- indent-scope textobjects
        words = { enabled = true }, -- LSP reference highlight, ]] / [[
        statuscolumn = { enabled = true }, -- also sets vim.o.statuscolumn
        scroll = { enabled = true }, -- smooth scrolling
        dim = { enabled = true }, -- dim inactive scopes (pairs with zen)
        zen = { enabled = true},

        indent = {
            enabled = true,
            indent = { char = "│" },
            scope = { char = "│", animate = { enabled = true } },
        },

        picker = {
            enabled = true,
            layout = { preset = "default" },
            formatters = { file = { filename_first = true } },
        },

        explorer = { enabled = true },

        dashboard = {
            preset = {
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                    { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                    {
                        icon = " ",
                        key = "c",
                        desc = "Config",
                        action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})"
                    },
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
                header = [[
          , ,\\ ,'\\,'\\ ,'\\ ,\\ ,   
    ,  ;\\/ \\' `'     `   '  /|   
    |\\/                      |   
    :                        |   
    :                        |   
     |                       |   
     |                       |   
     :               -.     _|   
      :                \\     `.  
      |         ________:______\\ 
      :       ,'o       / o    ; 
      :       \\       ,'-----./  
       \\_      `--.--'        )  
      ,` `.              ,---'|  
      : `                     |  
       `,-'                   |  
       /      ,---.          ,'  
    ,-'            `-,------'    
   '   `.        ,--'            
         `-.____/                
                 \\               
                ]]
            },
            sections = {
                { section = "header" },
                { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                { section = "startup" },
            },
        },
    },

    keys = {
        -- Top level: the ones used constantly
        { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart find files" },
        { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>e", function() Snacks.explorer() end, desc = "File explorer" },
        { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification history" },

        -- Find (files)
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent files" },
        { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find git files" },
        { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
        { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find config file" },

        -- Search
        { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Grep word", mode = { "n", "x" } },
        { "<leader>sl", function() Snacks.picker.lines() end, desc = "Buffer lines" },
        { "<leader>sh", function() Snacks.picker.help() end, desc = "Help pages" },
        { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
        { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
        { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer diagnostics" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP symbols" },
        { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP workspace symbols" },
        { "<leader>sr", function() Snacks.picker.resume() end, desc = "Resume last picker" },
        { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
        { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
        { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix list" },
        { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo history" },
        { "<leader>sR", function() Snacks.picker.registers() end, desc = "Registers" },
        { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command history" },
        { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },

        -- Git
        { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
        { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git log" },
        { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git log (line)" },
        { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git status" },
        { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git branches" },
        { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git browse", mode = { "n", "x" } },

        -- UI toggles (<leader>uc / ud / uh are defined elsewhere)
        { "<leader>uz", function() Snacks.zen() end, desc = "Toggle zen mode" },
        { "<leader>uZ", function() Snacks.zen.zoom() end, desc = "Toggle zoom" },

        -- snacks.words reference navigation
        { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next reference", mode = { "n", "t" } },
        { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev reference", mode = { "n", "t" } },
    },
}
