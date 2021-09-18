FactoryBot.define do
  factory :buy_destination do
    postal_code    { Faker::Address.zip }
    prefecture_id  { 2 }
    municipalities { Faker::Address.city }
    house_number   { Faker::Number.number(3) }
    building_name  { Faker::Address.street_name }
    tel            { '08011111111' }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
