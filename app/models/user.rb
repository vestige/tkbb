class User < ActiveRecord::Base
  def self.find_or_create_by_omniauth(auth)
    User.where(:provider => auth["provider"], :uid => auth["uid"]).first_or_create do |user|
      user.name = auth["info"]["name"]
      user.token = auth["credentials"]["token"]
      user.secret = auth["credentials"]["secret"]
    end
  end
end
