class Referi < ActiveRecord::Base
  attr_accessible :name, :lastname

  validates :name, :lastname, :presence => true
  
end
