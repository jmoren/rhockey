class Player < ActiveRecord::Base
  include Gravtastic
  has_gravatar
  has_many :game_actions
  belongs_to :team, :counter_cache => true
  has_one :photo, :as => :photoable, :dependent => :destroy
  accepts_nested_attributes_for :photo, :allow_destroy => true

  attr_accessible :name, :lastname, :email, :team_id, :captain, :gender, :goalkeeper, 
                  :age, :birthday, :photo_attributes, :can_play, :number
#validations
  validates_length_of :name, :lastname, :within => 3..15
  validates :name, :lastname, :birthday, :number, :presence => true
  after_save :recategorizar?

  scope "arqueros", :conditions =>{:goalkeeper => true}
  scope "jugadores", :conditions =>{:goalkeeper => false}

  def full_name
    "#{self.name} #{self.lastname}"
  end
  def short_name
    "#{self.name.first.upcase}. #{self.lastname.capitalize}"
  end

  def edad
    age = Time.now.year - self.birthday.year
    if Time.now.month < self.birthday.month ||
      (Time.now.month == self.birthday.month && self.birthday.day >= Time.now.day)
      age = age - 1
    end
    return age
  end

  def recategorizar?
    status = false
    edad = self.edad
    top_age = self.team.category.topage
    min_age = self.team.category.minage
    if (min_age > edad) || (top_age < edad)
      status = true
    end
    self.change_status(status)
    status
  end
  def can_play?
    !self.can_play
  end
  def change_status(new_status)
    if !(new_status == self.can_play)
      self.update_attributes(:can_play => new_status )
    end
  end
end
