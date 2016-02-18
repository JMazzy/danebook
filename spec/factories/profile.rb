FactoryGirl.define do
  factory :profile do
    sequence(:first_name) { |n| "Firsty#{n}" }
    sequence(:last_name) { |n| "Lasty#{n}" }
    sequence(:user_id) { |n| n }
  end
end
