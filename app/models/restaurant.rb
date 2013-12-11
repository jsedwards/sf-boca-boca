class Restaurant < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :listings
  has_many :lists, through: :listings
  validates_presence_of :name

  def self.tagged_with(name)
    Tag.find_by_name!(name).restaurants
  end

  def tag_list
    tags.map(&:name)
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

    def self.listed_with(name)
    List.find_by_name!(name).restaurants
  end

  def list_list
    lists.map(&:name)
  end

  def listing_list=(names)
    self.lists = names.split(",").map do |n|
      List.where(name: n.strip).first_or_create!
    end
  end

end