class UserSubscriptionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :subscription_id, :active
end
