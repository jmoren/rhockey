class AddFinishedToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :finished, :boolean, :default => false
  end

  def self.down
    remove_column :games, :finished
  end
end
