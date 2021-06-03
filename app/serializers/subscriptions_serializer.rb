class SubscriptionsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :price, :frequency
end
