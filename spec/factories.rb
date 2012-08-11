FactoryGirl.define do
  factory :gym do
    sequence(:name) { |n| "Gym name #{n}" }
  end

  factory :user do
    provider 'test'
    sequence(:uid) { |n| "UID #{n}" }
    sequence(:user_name) { |n| "User name #{n}" }
    token 'token_string'
    secret 'secret'
  end

  factory :climbing do
    comment ''
  end
end
