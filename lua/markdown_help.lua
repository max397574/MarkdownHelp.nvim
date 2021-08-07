local M = {}

local function create_commands()
  vim.cmd("command! -bang -nargs=0 MdHeading1 :lua require('markdown_help').Heading1()")
  vim.cmd("command! -bang -nargs=0 MdHeading2 :lua require('markdown_help').Heading2()")
  vim.cmd("command! -bang -nargs=0 MdHeading3 :lua require('markdown_help').Heading3()")
  vim.cmd("command! -bang -nargs=0 MdOrderedList :lua require('markdown_help').OrderedList()")
  vim.cmd("command! -bang -nargs=0 MdUnorderedList :lua require('markdown_help').UnorderedList()")
  vim.cmd("command! -bang -nargs=0 MdTaskList :lua require('markdown_help').TaskList()")
  vim.cmd("command! -bang -nargs=0 MdLink :lua require('markdown_help').Link()")
  vim.cmd("command! -bang -nargs=0 MdHorizontalRule :lua require('markdown_help').HorizontalRule()")
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

function M.Heading3()
  local text = vim.api.nvim_get_current_line()
  local new_text = "### " .. text
  local cursor = vim.api.nvim_win_get_cursor(0)
  local row = cursor[1]
  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_lines(bufnr,row-1,row-1,false,{new_text})
  vim.api.nvim_del_current_line()
end

function M.HorizontalRule()
  local new_text = "---"
  local cursor = vim.api.nvim_win_get_cursor(0)
  local row = cursor[1]
  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_lines(bufnr,row-1,row-1,false,{new_text})
  vim.api.nvim_del_current_line()
end

function M.OrderedList()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local row = cursor[1]
  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_lines(bufnr,row,row,false,{"1. List Item", "2. List Item", "3. List Item"})
end

function M.TaskList()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local row = cursor[1]
  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_lines(bufnr,row,row,false,{"[ ] List Item", "[ ] List Item", "[ ] List Item"})
end

function M.UnorderedList()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local row = cursor[1]
  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_lines(bufnr,row,row,false,{"* List Item", "* List Item", "* List Item"})
end

function M.Link()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local row = cursor[1]
  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_lines(bufnr,row,row,false,{"[text](link)"})
end

function M.init()
  create_commands()
end

return M
