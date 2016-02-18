FactoryGirl.define do
  factory :post do
    sequence(:body) { |n| "Post body number #{n}! The best post ever." }
    user
  end
end
