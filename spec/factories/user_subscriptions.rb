FactoryBot.define do
  factory :user_subscription do
    user { nil }
    subscription { nil }
    active { true }
  end
end
