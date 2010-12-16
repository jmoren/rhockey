class Championship < ActiveRecord::Base
  belongs_to :category
  attr_accessible :name, :start_date, :end_date, :type_options, :description, :category_id

  validates :start_date, :end_date, :name, :type_options, :presence => true
  validates_length_of :name, :within => 3..20
  validate :dates
  before_save :set_matches
  def set_matches
#    n = Equipos.where(:category_id => self.category_id).size
#    res = 0
#    for i in n..1
#      res = res + i*(i-1)
#    end
#    self.matches = res
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
