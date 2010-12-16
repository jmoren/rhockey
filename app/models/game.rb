class Game < ActiveRecord::Base
  belongs_to :championship
  has_many :authorities
  has_one :photo, :as => :photoable, :dependent => :destroy

  has_many :rivals
  has_many :teams, :through => :rivals
  has_one :local_rival, :class_name => "Rival", :conditions => {:local => true}
  has_one :visitor_rival, :class_name => "Rival", :conditions => {:local => false}
  has_one :local, :through => :local_rival, :source => :team
  has_one :visitor, :through => :visitor_rival, :source => :team

  accepts_nested_attributes_for :photo, :allow_destroy => true

  attr_accessible :championship_id, :ganador, :finished, :comment, :photo_attributes
  attr_writer :photo_attributes
end
