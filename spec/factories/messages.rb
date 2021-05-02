FactoryBot.define do
  factory :message do
    text { "MyText" }
    association :user
    association :item
  end
end
