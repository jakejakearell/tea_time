FactoryBot.define do
  factory :user do
    first_name { Faker::Games::Zelda.character }
    last_name { Faker::Games::Zelda.character }
    email { Faker::Internet.email }
    address { Faker::Games::Zelda.location }
  end
end
