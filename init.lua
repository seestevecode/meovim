vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- options --------------------------------------------------------------------

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")

vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.undofile = true

vim.opt.laststatus = 3

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.swapfile = false

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 500

vim.opt.splitright = true
vim.opt.splitbelow = true

-- TODO: options to display whitespace characters

vim.opt.inccommand = "split"
vim.opt.backspace = "indent,eol,start"

vim.opt.cursorline = true
vim.opt.scrolloff = 8

vim.opt.hlsearch = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.termguicolors = true
vim.opt.background = "dark"

-- keymaps --------------------------------------------------------------------

-- escape insert mode with `jk`
vim.keymap.set("i", "jk", "<Esc>", { silent = true })

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make windows equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- window movement with vim keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

-- buffer management
vim.keymap.set("n", "<S-h>", "<cmd>bprev<CR>", { silent = true }) -- previous buffer
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { silent = true }) -- next buffer
vim.keymap.set("n", "<S-x>", "<cmd>bdelete<CR>", { silent = true }) -- delete current buffer

-- move lines vertically
-- https://vim.fandom.com/wiki/Moving_lines_up_or_down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true })
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { silent = true })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })

-- clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"*y', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>p", '"*p', { noremap = true, silent = true })

-- commands -------------------------------------------------------------------

-- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("seestevecode-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- lazy -------------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
    change_detection = { notify = false },
    checker = {
        enabled = true,
        notify = false,
    },
})
