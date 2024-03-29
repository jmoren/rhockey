class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer :photoable_id
      t.string  :photoable_type
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
