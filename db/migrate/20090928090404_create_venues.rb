class CreateVenues < ActiveRecord::Migration
  def self.up
    create_table :venues do |t|
      t.string :name
      t.string :map_url
      t.text :comments
      t.references :location

      t.timestamps
    end
  end

  def self.down
    drop_table :venues
  end
end
