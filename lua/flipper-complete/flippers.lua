local M = {}

local _cache = nil

function M._reset_cache()
  _cache = nil
end

local function load_flippers()
  if _cache then
    return _cache
  end

  local config = require('flipper-complete')._config
  local filepath = config.features_path

  local ok, result = pcall(function()
    local flippers = {}

    for line in io.lines(filepath) do
      local name, description = line:match('^([A-Za-z0-9_]+): (.+)$')

      if name and description then
        if not (name == 'ROLLOUT_test_feature_with_description') then
          description = vim.trim(description)
          description = description:gsub('^["\']', ''):gsub('["\']$', '')
          flippers[name] = description
        end
      end
    end

    return flippers
  end)

  if ok then
    _cache = result
  else
    _cache = {}
  end

  return _cache
end

function M.all(prefix)
  local flippers = load_flippers()

  if prefix == 'featureEnabled' then
    local js_flippers = {}

    for name, description in pairs(flippers) do
      local new_name = name:match('_([_a-z]+)')
      if new_name then
        new_name = new_name:gsub('enable_', ''):gsub('disable_', '')
        js_flippers[new_name] = description
      end
    end

    return js_flippers
  else
    return flippers
  end
end

function M.valid_prefix(prefix)
  if prefix == nil or prefix == '' then
    return false
  end

  local config = require('flipper-complete')._config

  for _, valid_prefix in ipairs(config.prefixes) do
    if vim.startswith(prefix, valid_prefix) then
      return true
    end
  end

  return false
end

return M
