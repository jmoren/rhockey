require 'test_helper'

class ReferiTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Referi.new.valid?
  end
end
