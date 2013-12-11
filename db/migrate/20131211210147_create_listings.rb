class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.belongs_to :list, index: true
      t.belongs_to :restaurant, index: true
      t.string :name
      t.timestamps
    end
  end
end
