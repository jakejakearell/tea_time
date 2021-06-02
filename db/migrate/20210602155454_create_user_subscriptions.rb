class CreateUserSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_subscriptions do |t|
      t.references :user, foreign_key: true
      t.references :subscription, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
