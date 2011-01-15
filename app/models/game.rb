class Game < ActiveRecord::Base
  belongs_to :championship
  has_one :photo, :as => :photoable, :dependent => :destroy
  has_many :game_actions
  has_many :rivals
  has_many :teams, :through => :rivals

  has_many :authorities
  has_many :referis, :through => :authorities

  has_one :local_rival, :class_name => "Rival", :conditions => {:local => true}
  has_one :visitor_rival, :class_name => "Rival", :conditions => {:local => false}
  has_one :local, :through => :local_rival, :source => :team
  has_one :visitor, :through => :visitor_rival, :source => :team
  has_one :winner
  has_one :team_winner, :through => :winner, :source => :team
  attr_accessible :championship_id,:code, :finished, :comment, :photo_attributes
  after_create :set_code
  #validates :code, :presence => true
  validates_associated :rivals, :authorities
  
  def set_code
    ini = self.championship.category.name.first + self.championship.category.name.last
    self.code = ini + rand(9999).to_s
  end
  def set_gunner
    self.game_actions.goals.collect(&:player).sort {|a,b| b.game_actions.goals.where(:game_id => self.id).count <=> a.game_actions.goals.where(:game_id => self.id).count}.first
  end
  def set_dirty_player
    self.game_actions.penalties.collect(&:player).sort {|a,b| b.game_actions.penalties.where(:game_id => self.id).count <=> a.game_actions.penalties.where(:game_id => self.id).count}.first
  end
end
