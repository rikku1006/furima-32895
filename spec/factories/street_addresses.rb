FactoryBot.define do
  factory :street_address do
    association :purchase_record
  end
end
