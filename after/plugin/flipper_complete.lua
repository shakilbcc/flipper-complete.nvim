local has_cmp, cmp = pcall(require, 'cmp')
if has_cmp then
  local flipper_complete = require('flipper-complete')
  if not flipper_complete._setup_called then
    flipper_complete.setup()
  end

  cmp.register_source('flipper_complete', require('flipper-complete.cmp').new())
end
