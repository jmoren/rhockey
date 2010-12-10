class CreateReferis < ActiveRecord::Migration
  def self.up
    create_table :referis do |t|
      t.string :name
      t.string :lastname
      t.timestamps
    end
  end

  def self.down
    drop_table :referis
  end
end
