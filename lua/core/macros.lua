-- Example Macro to replace current single quote pair with double quotes 
vim.cmd([[
let @a = "\<Esc>f\'r\"f\'r\""
]])
