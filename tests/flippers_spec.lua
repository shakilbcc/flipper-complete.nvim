local helpers = require('helpers')
local flippers = require('flipper-complete.flippers')
local flipper_complete = require('flipper-complete')

describe('flippers', function()
  before_each(function()
    helpers.setup_mocks()
    flipper_complete.setup()
  end)

  after_each(function()
    helpers.teardown_mocks()
  end)

  it('loads features from YAML file', function()
    local result = flippers.all('Features.enabled?')

    assert.is_not_nil(result)
    assert.equals('Allow users to toggle dark mode', result['ROLLOUT_enable_dark_mode'])
    assert.equals('Phase out old interface', result['ROLLOUT_disable_legacy_ui'])
    assert.equals('Push notification support', result['ROLLOUT_enable_notifications'])
  end)

  it('excludes ROLLOUT_test_feature_with_description', function()
    local result = flippers.all('Features.enabled?')

    assert.is_nil(result['ROLLOUT_test_feature_with_description'])
  end)

  it('transforms names for featureEnabled prefix', function()
    local result = flippers.all('featureEnabled')

    assert.is_not_nil(result)
    assert.is_nil(result['ROLLOUT_enable_dark_mode'])
    assert.equals('Allow users to toggle dark mode', result['dark_mode'])
    assert.equals('Phase out old interface', result['legacy_ui'])
    assert.equals('Push notification support', result['notifications'])
  end)

  it('returns empty table when file does not exist', function()
    helpers.file_exists = false
    flippers._reset_cache()
    flipper_complete.setup()

    local result = flippers.all('Features.enabled?')

    assert.is_not_nil(result)
    assert.same({}, result)
  end)

  it('caches result after first load', function()
    local result1 = flippers.all('Features.enabled?')
    helpers.file_exists = false
    local result2 = flippers.all('Features.enabled?')

    assert.equals(result1, result2)
  end)

  it('validates known prefixes', function()
    assert.is_true(flippers.valid_prefix('Features.enabled?'))
    assert.is_true(flippers.valid_prefix('Features.feature_enabled?'))
    assert.is_true(flippers.valid_prefix('featureEnabled'))
    assert.is_true(flippers.valid_prefix('feature_enabled?'))
    assert.is_true(flippers.valid_prefix('with_feature'))
    assert.is_true(flippers.valid_prefix('without_feature'))
  end)

  it('rejects invalid prefixes', function()
    assert.is_false(flippers.valid_prefix('SomeOther'))
    assert.is_false(flippers.valid_prefix(''))
    assert.is_false(flippers.valid_prefix(nil))
  end)

  it('strips surrounding quotes from descriptions', function()
    local result = flippers.all('Features.enabled?')

    assert.equals('Enables the new search feature', result['ROLLOUT_enable_search'])
  end)

  it('uses configurable prefixes', function()
    flipper_complete.setup({ prefixes = { 'CustomPrefix' } })

    assert.is_true(flippers.valid_prefix('CustomPrefix'))
    assert.is_false(flippers.valid_prefix('Features.enabled?'))
  end)
end)
