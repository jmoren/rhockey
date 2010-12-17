module ApplicationHelper
  def full_name(player)
    "#{player.name.capitalize} #{player.lastname.capitalize}"
  end
  def nice_date(date)
    date.strftime('%d.%m.%Y')
  end
end
