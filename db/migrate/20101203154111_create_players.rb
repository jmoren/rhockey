class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
    #personal information
      t.string :name
      t.string :lastname
      t.string :email
      t.string :gender
      t.date :birthday
    #hockey information
      t.boolean :can_play, :default => true
      t.boolean :captain, :default => nil
      t.integer :team_id
      t.boolean :goalkeeper, :default => nil


      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
