module ApplicationHelper
  def full_name(person)
    "#{person.name.capitalize} #{person.lastname.capitalize}"
  end
end
