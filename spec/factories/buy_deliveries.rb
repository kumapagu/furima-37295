FactoryBot.define do
  factory :buy_delivery do
    Faker::Config.locale = :ja
    post_code              { Faker::Address.postcode }
    prefecture_id          { Faker::Number.between(from: 2, to: 48) }
    city                   { Faker::Address.city }
    block                  { Faker::Address.street_address }
    building               { Faker::Address.secondary_address }
    phone_number           { Faker::PhoneNumber.subscriber_number(length: 10) }
    token                  { "tok_abcdefghijk00000000000000000" }

    
  end
end
