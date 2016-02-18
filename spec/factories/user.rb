FactoryGirl.define do
  factory :user, aliases: [:friend,:friendee,:friender] do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "password"
    profile
  end
end
