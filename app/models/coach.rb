class Coach < ActiveRecord::Base
  belongs_to :team
  attr_accessible :name, :lastname, :team_id, :email
#validations
  validates :email, :team_id, :name, :lastname, :presence => true
  validates_length_of :name, :lastname, :within => 3..20
  validates_format_of :email, :with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/
  validates_uniqueness_of :email
end
