FactoryBot.define do
  factory :user do
    # Faker::Config.locale = :ja
    nickname                  { Faker::Name.initials(number: 2) }
    email                     { Faker::Internet.free_email }
    # password                  { Faker::Internet.password(min_length: 6, mix_case: true) }
    password                  { Faker::Lorem.characters(min_alpha: 1, min_numeric: 1, number: 6) }
    password_confirmation     { password }
    birthday                  { Faker::Date.birthday(min_age: 10, max_age: 60).strftime('%Y-%m-%d') }
    first_name                { '太郎' }
    last_name                 { '山田' }
    first_name_kana           { 'タロウ' }
    last_name_kana            { 'ヤマダ' }
  end
end
