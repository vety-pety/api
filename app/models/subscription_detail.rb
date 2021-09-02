class SubscriptionDetail < ApplicationRecord
  belongs_to :subscription, required: true
end
