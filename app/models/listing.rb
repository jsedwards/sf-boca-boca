class Listing < ActiveRecord::Base
  has_many :restaurants
  has_many :lists
end