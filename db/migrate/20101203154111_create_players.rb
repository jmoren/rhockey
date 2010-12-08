class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
    #personal information
      t.string :name
      t.string :lastname
      t.string :email, :default => "exapmle@example.com"
      t.string :gender
      t.date :birthday
      t.integer :team_id
    #hockey information
      t.boolean :can_play, :default => true
      t.boolean :captain, :default => false
      t.boolean :goalkeeper, :default => false


      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
