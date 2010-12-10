class Coach < ActiveRecord::Base
  include Gravtastic
  has_gravatar

  belongs_to :team
  has_one :photo, :as => :photoable, :dependent => :destroy
  accepts_nested_attributes_for :photo, :allow_destroy => true
  attr_accessible :name, :lastname, :team_id, :email, :image_attributes
#validations
  validates :email, :team_id, :name, :lastname, :presence => true
#  validates_length_of :name, :lastname, :within => 3..20
#  validates_format_of :email, :with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/
#  validates_uniqueness_of :email
def to_param
    "#{id}-#{name}"
  end
  def edad
    age = Time.now.year - self.birthday.year
    if Time.now.month < self.birthday.month ||
      (Time.now.month == self.birthday.month && self.birthday.day >= Time.now.day)
      age = age - 1
    end
    return age
  end
end
