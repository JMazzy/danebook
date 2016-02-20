FactoryGirl.define do
  factory :post, aliases: [:likable,:commentable] do
    sequence(:body) { |n| "Post body number #{n}! The best post ever." }
    user
  end
end
