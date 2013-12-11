class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :restaurants, through: :taggings
end