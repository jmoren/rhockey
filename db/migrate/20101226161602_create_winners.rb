class CreateWinners < ActiveRecord::Migration
  def self.up
    create_table :winners do |t|
      t.integer :game_id
      t.integer :team_id

      t.timestamps
    end
  end

  def self.down
    drop_table :winners
  end
end
