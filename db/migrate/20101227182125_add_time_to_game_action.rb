class AddTimeToGameAction < ActiveRecord::Migration
  def self.up
    add_column :game_actions, :time, :string
  end

  def self.down
    remove_column :game_actions, :time
  end
end
