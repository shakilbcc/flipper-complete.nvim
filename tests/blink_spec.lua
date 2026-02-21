local helpers = require('helpers')

describe('blink source', function()
  before_each(function()
    helpers.setup_mocks()
  end)

  after_each(function()
    helpers.teardown_mocks()
  end)

  it('get_trigger_characters returns quote and colon chars', function()
    local blink = require('flipper-complete.blink')
    local source = blink.new({}, {})
    assert.same({ ':', '"', "'" }, source:get_trigger_characters())
  end)

  it('new() initializes config from opts', function()
    local blink = require('flipper-complete.blink')
    blink.new({ features_path = '/custom/path.yml' }, {})

    local config = require('flipper-complete')._config
    assert.equals('/custom/path.yml', config.features_path)
  end)

  it('get_completions calls callback with items on match', function()
    local blink = require('flipper-complete.blink')
    local source = blink.new({}, {})

    local result
    source:get_completions({
      line = 'Features.enabled?("',
      cursor = { 4, 20 },
    }, function(response)
      result = response
    end)

    assert.is_not_nil(result)
    assert.is_not_nil(result.items)
    assert.equals(4, #result.items)
  end)

  it('get_completions calls callback with empty items on no match', function()
    local blink = require('flipper-complete.blink')
    local source = blink.new({}, {})

    local result
    source:get_completions({
      line = 'plain text',
      cursor = { 1, 10 },
    }, function(response)
      result = response
    end)

    assert.is_not_nil(result)
    assert.same({}, result.items)
  end)

  it('maps blink row (1-indexed) to 0-indexed line_number', function()
    local blink = require('flipper-complete.blink')
    local source = blink.new({}, {})

    local result
    source:get_completions({
      line = 'Features.enabled?("',
      cursor = { 10, 20 },
    }, function(response)
      result = response
    end)

    assert.is_not_nil(result)
    assert.equals(4, #result.items)
    local item = result.items[1]
    assert.equals(9, item.textEdit.range.start.line)
  end)
end)
