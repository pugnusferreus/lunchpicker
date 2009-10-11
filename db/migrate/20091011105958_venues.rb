class Venues < ActiveRecord::Migration
  def self.up
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.text :comments
      t.references :location
      t.boolean :sheltered, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :venues
  end
end
