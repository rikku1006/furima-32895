FactoryBot.define do
  factory :purchase_information do
    postal_code              { '111-1111' }
    shipping_area_id         { 2 }
    municipality             { 'お' }
    address                  { 'お' }
    building_name            { 'お' }
    phone_number             { '00000000000' }
    token                    { 'tok_abcdefghijk00000000000000000' }
  end
end
