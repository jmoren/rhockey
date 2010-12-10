class Category < ActiveRecord::Base
  has_many :teams
end
