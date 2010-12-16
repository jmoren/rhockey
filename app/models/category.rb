class Category < ActiveRecord::Base
  has_many :teams
  has_many :championships
end
