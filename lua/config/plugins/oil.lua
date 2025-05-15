return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local detail = false -- Whether or not detail should show by default
        require("oil").setup({
            skip_confirm_for_simple_edits = true,
            keymaps = {
                ["gd"] = {
                    desc = "Toggle file detail view",
                    callback = function()
                        detail = not detail
                        if detail then
                            require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
                        else
                            require("oil").set_columns({ "icon" })
                        end
                    end,
                },
            },
            float = {
                max_width = 120,
                max_height = 40,
            },
        })

        vim.keymap.set("n", "-", "<cmd>Oil --float<CR>")
    end,
}
