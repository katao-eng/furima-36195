FactoryBot.define do
  factory :user do
    Faker::Config.locale = :ja
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'a1' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { Faker::Name.last_name }
    first_name            { Faker::Name.first_name }
    family_name_kana      { Gimei.last.katakana }
    first_name_kana       { Gimei.first.katakana }
    birthday              { Faker::Date.birthday }
  end
end
