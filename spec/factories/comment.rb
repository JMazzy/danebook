FactoryGirl.define do
  factory :comment do
    sequence(:body) { |n| "Comment body number #{n}! The best comment ever." }
    user
  end
end
