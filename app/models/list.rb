class List < ActiveRecord::Base
  has_many :listings
  has_many :restaurants, through: :listings
end