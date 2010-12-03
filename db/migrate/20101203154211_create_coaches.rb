class CreateCoaches < ActiveRecord::Migration
  def self.up
    create_table :coaches do |t|
      t.string :name
      t.string :lastname
      t.integer :team_id
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :coaches
  end
end
