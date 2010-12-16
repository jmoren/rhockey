class Referi < ActiveRecord::Base
  has_many :authorities
  has_many :games, :through => :authorities
  attr_accessible :name, :lastname

  validates :name, :lastname, :presence => true
  
end
