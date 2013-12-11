class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.belongs_to :tag 
      t.belongs_to :restaurant
    end
  end
end
