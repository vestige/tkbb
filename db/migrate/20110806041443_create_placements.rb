class CreatePlacements < ActiveRecord::Migration
  def self.up
    create_table :placements do |t|
      t.string :name
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end

  def self.down
    drop_table :placements
  end
end
