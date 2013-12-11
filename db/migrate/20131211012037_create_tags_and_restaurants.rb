class CreateTagsAndRestaurants < ActiveRecord::Migration
  def change
    create_table :tags_and_restaurants do |t|
      t.belongs_to :tag
      t.belongs_to :restaurant 
    end
  end
end
