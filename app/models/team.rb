class Team < ActiveRecord::Base
  has_many :players
  has_many :coaches
  belongs_to :category
  has_one :photo, :as => :photoable, :dependent => :destroy
  accepts_nested_attributes_for :photo, :allow_destroy => true
  attr_accessible :name, :category_id, :players_count, :image_attributes
  validates :name, :presence => true
  validates_uniqueness_of :name
  
end
