module ApplicationHelper
  def full_name(player)
    "#{player.name} #{player.lastname}"
  end
end
