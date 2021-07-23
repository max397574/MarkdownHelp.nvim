local M = {}

local function create_commands()
  vim.cmd("command! -bang -nargs=0 MdHeading1 :lua require('markdown_help').Heading1()")
  vim.cmd("command! -bang -nargs=0 MdHeading2 :lua require('markdown_help').Heading2()")
end

function M.Heading1()
  local text = vim.api.nvim_get_current_line()
  local length = #text
  local head_indicator = string.rep("=",length)
  local cursor = vim.api.nvim_win_get_cursor(0)
  local row = cursor[1]
  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_lines(bufnr,row,row,false,{head_indicator})
end

function M.Heading2()
  local text = vim.api.nvim_get_current_line()
  local length = #text
  local head_indicator = string.rep("-",length)
  local cursor = vim.api.nvim_win_get_cursor(0)
  local row = cursor[1]
  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_lines(bufnr,row,row,false,{head_indicator})
end

function M.init()
  create_commands()
end

return M
