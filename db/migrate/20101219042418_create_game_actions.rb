class CreateGameActions < ActiveRecord::Migration
  def self.up
    create_table :game_actions do |t|
      t.integer :championship_id
      t.integer :game_id
      t.integer :team_id
      t.integer :player_id
      t.string :action
      t.timestamps
    end
  end

  def self.down
    drop_table :game_actions
  end
end
