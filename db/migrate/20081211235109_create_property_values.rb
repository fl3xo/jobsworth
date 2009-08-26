class CreatePropertyValues < ActiveRecord::Migration
  def self.up
    create_table :property_values do |t|
      t.integer :property_id
      t.string :value
      t.string :color
      t.string :default

      t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :property_values
  end
end
