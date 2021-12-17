FactoryBot.define do  
  factory :item do
    name                          { Faker::String.random(length: 6) }
    item_description              { Faker::String.random }
    category_id                   { Faker::Number.between(from: 2, to: 11) }
    status_id                     { Faker::Number.between(from: 2, to: 7) }
    delivery_charge_id            { Faker::Number.between(from: 2, to: 3) }
    prefecture_id                 { Faker::Number.between(from: 2, to: 48) }
    ship_days_id                  { Faker::Number.between(from: 2, to: 4) }
    price                         { Faker::Number.between(from: 300, to: 9999999) }
    
    association :user
    
    after(:build) do |item|
    item.image.attach(io:File.open("public/images/test_image.png"), filename: "test_image.png")
    end
  end
end
