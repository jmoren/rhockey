require 'test_helper'

class ChampionshipTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Championship.new.valid?
  end
end
