class CreateChampionships < ActiveRecord::Migration
  def self.up
    create_table :championships do |t|
      t.string  :name
      t.date    :start_date
      t.date    :end_date
      t.string  :type_options
      t.text    :description
      t.integer :category_id
      t.boolean :closed, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :championships
  end
end
