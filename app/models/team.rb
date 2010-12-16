class Team < ActiveRecord::Base
  has_many :players
  has_many :coaches
  has_many :rivals
  has_many :games, :through => :rivals
  has_one :photo, :as => :photoable, :dependent => :destroy
  belongs_to :category

  accepts_nested_attributes_for :photo, :allow_destroy => true

  attr_accessible :name, :category_id, :players_count,
                  :photo_attributes, :players_attributes,:coaches_attributes
                
  validates :name, :presence => true
  validates_uniqueness_of :name
  
  def to_param
    "#{name}"
  end
end
