local M = {}

M._config = {
  features_path = './config/feature-descriptions.yml',
  prefixes = {
    'Features.enabled?',
    'Features.feature_enabled?',
    'featureEnabled',
    'feature_enabled?',
    'with_feature',
    'without_feature',
  },
}

M._setup_called = false

function M.setup(opts)
  M._config = vim.tbl_deep_extend('force', M._config, opts or {})
  M._setup_called = true

  require('flipper-complete.flippers')._reset_cache()
end

return M
