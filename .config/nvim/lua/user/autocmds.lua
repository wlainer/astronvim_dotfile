local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local function set_quit_keymap(buf)
  vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = buf, silent = true, nowait = true })
end

autocmd("VimLeave", {
  desc = "Stop running auto compiler",
  group = vim.api.nvim_create_augroup("autocomp", { clear = true }),
  pattern = "*",
  callback = function() vim.fn.jobstart { "autocomp", vim.fn.expand "%:p", "stop" } end,
})

-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
vim.o.autoread = true
autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

autocmd("FileType", {
  desc = "Make q or esc close help, man, quickfix, dap floats",
  group = augroup("q_close_windows", { clear = true }),
  pattern = {
    "qf",
    "help",
    "man",
    "dap-float",
    "fugitiveblame",
    "neotest-summary",
    "neotest-output",
  },
  callback = function(event) set_quit_keymap(event.buf) end,
})

autocmd("BufEnter", {
  desc = "Make q or esc empty filetype window",
  pattern = "*",
  callback = function(event)
    if vim.o.filetype == "" then set_quit_keymap(event.buf) end
  end,
})
