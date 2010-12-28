module ApplicationHelper
  def full_name(person)
    "#{person.name.capitalize} #{person.lastname.capitalize}"
  end
  def nice_date(date)
    date.strftime('%d.%m.%Y')
  end
end
