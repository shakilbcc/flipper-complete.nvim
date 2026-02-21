local source = {}

function source.new()
  return setmetatable({}, { __index = source })
end

function source:get_trigger_characters()
  return { ':', '"', "'" }
end

function source:is_available()
  local config = require('flipper-complete')._config
  return vim.fn.filereadable(config.features_path) == 1
end

function source:complete(request, callback)
  local line_text = request.context.cursor_before_line .. request.context.cursor_after_line
  local line_number = request.context.cursor.row - 1
  local cursor_col = request.context.cursor.col - 1

  local items = require('flipper-complete.items').build_items({
    line_text = line_text,
    line_number = line_number,
    cursor_col = cursor_col,
  })

  if items then
    callback({ items = items, isIncomplete = true })
  else
    callback({ isIncomplete = true })
  end
end

return source
