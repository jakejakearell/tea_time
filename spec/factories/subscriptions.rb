FactoryBot.define do
  factory :subscription do
    title { Faker::Games::Pokemon.name }
    price { 1.5 }
    frequency { "MyString" }
  end
end
