class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :user_subscriptions
  has_many :subscriptions, through: :user_subscriptions

  def self.all_subscriptions(id)
    find(id)
    .subscriptions
  end
end
