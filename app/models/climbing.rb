class Climbing < ActiveRecord::Base
  belongs_to :user
  belongs_to :gym
  
  scope :with_user, includes(:user)
end
