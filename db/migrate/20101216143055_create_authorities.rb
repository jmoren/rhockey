class CreateAuthorities < ActiveRecord::Migration
  def self.up
    create_table :authorities do |t|
      t.integer :game_id
      t.integer :referi_id

      t.timestamps
    end
  end

  def self.down
    drop_table :authorities
  end
end
