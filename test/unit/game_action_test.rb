require 'test_helper'

class GameActionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert GameAction.new.valid?
  end
end
