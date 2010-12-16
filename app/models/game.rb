class Game < ActiveRecord::Base
  belongs_to :championship

  has_many :rivals
  has_many :teams, :through => :rivals

  has_many :authorities
  has_many :referis, :through => :authorities

  has_one :local_rival, :class_name => "Rival", :conditions => {:local => true}
  has_one :visitor_rival, :class_name => "Rival", :conditions => {:local => false}
  has_one :local, :through => :local_rival, :source => :team
  has_one :visitor, :through => :visitor_rival, :source => :team

  attr_accessible :championship_id, :code
  before_save :set_code
  #validates :code, :presence => true
  validates_associated :rivals, :authorities

  def set_code
    ini = self.championship.category.name.first + self.championship.category.name.last
    self.code = ini + rand(9999).to_s
  end
end
