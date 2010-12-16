class CreateRivals < ActiveRecord::Migration
  def self.up
    create_table :rivals do |t|
      t.integer :team_id
      t.integer :game_id
      t.boolean :local
      t.boolean :winner, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :rivals
  end
end
