class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string :name
      t.integer :category_id
      t.integer :players_count, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :teams
  end
end
