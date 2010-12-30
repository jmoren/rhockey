class Team < ActiveRecord::Base
  has_many :players
  has_many :coaches
  has_many :rivals
  has_many :game_actions
  has_many :goals, :source => :game_actions, :conditions => [:action => "goal"]
  has_many :games_played, :through => :rivals, :source => :game
  has_one :photo, :as => :photoable, :dependent => :destroy
  has_many :winner
  has_many :games_won, :through => :winners, :source => :game
  
  belongs_to :category

  accepts_nested_attributes_for :photo, :allow_destroy => true

  attr_accessible :name, :category_id, :players_count,:photo_attributes
                  
                
  validates :name, :presence => true
  validates_uniqueness_of :name
  
  def to_param
    "#{name}"
  end
  def goals(game)
    self.game_actions.where(:action => "goal", :game_id => game).count
  end
  def data(game)
    self.game_actions.where(:game_id => game)
  end
end
