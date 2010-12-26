module ApplicationHelper
  def full_name(person)
    "#{person.name} #{person.lastname}"
  end
end
