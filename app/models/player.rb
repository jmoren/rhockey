class Player < ActiveRecord::Base
  belongs_to :team, :counter_cache => true
  attr_accessible :name, :lastname, :email, :team_id, :captain, :gender, :goalkeeper, :age, :birthday
#validations
  validates_length_of :name, :lastname, :within => 3..20
  validates :name, :lastname, :email, :presence => true
  validates_format_of :email, :with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/
  validates_uniqueness_of :email
  
end
