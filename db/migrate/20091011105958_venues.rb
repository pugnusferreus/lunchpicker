class Venues < ActiveRecord::Migration
  def self.up
    change_table :venues do |t|
      t.boolean :sheltered, :default => false
    end
    
  end

  def self.down
    remove_column :venues, :sheltered
  end
end
