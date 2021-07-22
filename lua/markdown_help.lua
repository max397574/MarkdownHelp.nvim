local M = {}

local function create_commands()
  vim.comd("command! MdHeading1 :lua require('markdown_help').Heading1")
end

function Heading1()
  local text = vim.api.nvim_get_current_line()
  local length = #text
  local head_indicator = string.rep("=",length)

end

function M.init()
  create_commands()
end

return M
