class SubscriptionPlanSerializer < ActiveModel::Serializer
  attributes :id, :description, :price, :details
end
