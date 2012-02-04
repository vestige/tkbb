class Placement < ActiveRecord::Base
  attr_accessible :name, :latitude, :longitude
  geocoded_by :name
  after_validation :geocode, :if => :name_changed?
  
  scope :search, lambda { |query|
    where([ "name LIKE ?", "%#{query}%" ])
  }
end
