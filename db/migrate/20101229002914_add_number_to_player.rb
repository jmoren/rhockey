class AddNumberToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :number, :integer
  end

  def self.down
    remove_column :players, :number
  end
end
