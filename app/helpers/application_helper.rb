module ApplicationHelper
  def full_name(player)
    "#{player.name.capitalize} #{player.lastname.capitalize}"
  end
end
