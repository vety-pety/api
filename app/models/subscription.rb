class Subscription < ApplicationRecord
  has_many :details, class_name: 'SubscriptionDetails', inverse_of: :subscription,
                     dependent: :destroy,
                     foreign_key: :subscription_id,
end
