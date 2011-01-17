class GameAction < ActiveRecord::Base
  belongs_to :player
  belongs_to :game
  belongs_to :team
  belongs_to :championship
  has_one :actions
  attr_accessible :championship_id, :game_id, :team_id, :player_id, :action, :time

  scope :goals, lambda {where("action = ?", "goal")}
  scope :assistances, lambda {where("action = ?", "assistance")}
  scope :saves, lambda {where("action = ?", "save")}
  scope :penalties, lambda {where("action = ?", "penalty")}
  scope :all_actions, lambda{where("action != ?","goal")}
end
