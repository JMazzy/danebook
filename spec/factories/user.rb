FactoryGirl.define do
  factory :user, aliases: [:friend,:friendee,:friender] do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "password"
    profile
  end

  factory :profile do
    sequence(:first_name) { |n| "Firsty#{n}" }
    sequence(:last_name) { |n| "Lasty#{n}" }
    sequence(:user_id) { |n| n }
  end
end
