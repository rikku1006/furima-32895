FactoryBot.define do
  factory :item do
    product_name                { 'オムライス' }
    product_description         { 'オムライスです' }
    category_id                 { 2 }
    product_condition_id        { 2 }
    pay_for_shipping_id         { 2 }
    shipping_area_id            { 2 }
    days_to_ship_id             { 2 }
    price                       { 11_111 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_furima.png'), filename: 'test_furima.png')
    end
  end
end
