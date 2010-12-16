class Championship < ActiveRecord::Base
  has_many :games
  belongs_to :category
  attr_accessible :name, :start_date, :end_date, :type_options, :description, :category_id

  validates :start_date, :end_date, :name, :type_options, :presence => true
  validates_length_of :name, :within => 3..20
  validate :dates
  before_save :set_matches
  def set_matches
#    n = self.category.teams.size
#    res = 0
#    for i in n..1
#      res = res + i-1)
#    end
#    self.matches = res
  end
  def to_param
    "#{id}_#{name}-#{self.category.name.gsub(/[' ']/, "_")}-#{start_date.year}"
  end
  def set_closed
    if self.end_date > (Time.now + 1.day)
      self.update_attributes(:closed => true) unless self.closed 
    end
  end
  def dates
    errors.add_to_base('La fecha de fin del campeonato tiene que ser mayor a la de inicio') if end_date < start_date
  end

end
