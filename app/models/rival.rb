class Rival < ActiveRecord::Base
  belongs_to :game
  belongs_to :team
  attr_accessible :game_id, :team_id, :local
end
