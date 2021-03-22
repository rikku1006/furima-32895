FactoryBot.define do
  factory :user do
    nickname                      { Faker::Name.initials }
    email                         { Faker::Internet.free_email }
    password                      { Faker::Internet.password(min_length: 6) }
    password_confirmation         { password }
    first_name                    { '山田' }
    last_name                     { '健太郎' }
    kana_first_name               { 'ヤマダ' }
    kana_last_name                { 'ケンタロウ' }
    birthday                      { Faker::Date.between(from: '1930-01-01', to: '2016-12-31') }
  end
end
