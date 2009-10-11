class Locations < ActiveRecord::Migration
  def self.up
    change_table :locations do |t|
      t.string :weather_location
    end
  end

  def self.down
    remove_column :locations, :weather_location
  end
end
