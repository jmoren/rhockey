require 'test_helper'

class CoachTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Coach.new.valid?
  end
end
