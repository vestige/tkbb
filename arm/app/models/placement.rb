class Placement < ActiveRecord::Base
  scope :search, lambda { |query|
    where([ "name LIKE ?", "%#{query}%" ])
  }
end
