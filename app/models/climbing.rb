class Climbing < ActiveRecord::Base
  belongs_to :user_id
  belongs_to :gym_id
end
