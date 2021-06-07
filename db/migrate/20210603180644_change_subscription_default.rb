class ChangeSubscriptionDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :user_subscriptions, :active, :boolean, :default => true
  end
end
