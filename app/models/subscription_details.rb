class SubscriptionDetails < ApplicationRecord
  belongs_to :subscription, required: true
end
