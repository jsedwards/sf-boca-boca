class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :hours
      t.string :reservations
      t.string :telephone
      t.string :website
      t.string :cuisine
      t.string :atmosphere
      t.timestamps
    end
  end
end
