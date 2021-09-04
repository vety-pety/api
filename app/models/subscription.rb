class Subscription < ApplicationRecord
  has_many :details, class_name: 'SubscriptionDetail', inverse_of: :subscription, dependent: :destroy, foreign_key: :subscription_id
end
