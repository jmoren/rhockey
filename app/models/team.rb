class Team < ActiveRecord::Base
  has_many :players
  has_many :coaches
  attr_accessible :name, :category_id, :players_count

  validates :name, :presence => true
  validates_uniqueness_of :name
  
end
