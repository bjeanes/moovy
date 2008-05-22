class CreateDisks < ActiveRecord::Migration
  def self.up
    create_table :disks do |t|
      t.string :label
      t.timestamps
    end
  end

  def self.down
    drop_table :disks
  end
end
