class SubscriptionDetail < ApplicationRecord
  self.inheritance_column = :foo #using type for now but change the column name later on

  belongs_to :subscription, required: true
end
