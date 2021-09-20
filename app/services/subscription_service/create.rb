class SubscriptionService::Create < ApplicationService
  attr_reader :user, :subscription_plan, :subscription

  def initialize(user, subscription_plan)
    @user = user
    @subscription_plan = subscription_plan
    new_subscription_for_user
  end

  def call
    subscription.transaction(requires_new: true) do
      unless subscription.save!
        # fail with error need here.
        user.errors.add(:user, :save_error, message: 'invalid subscription')
        raise 'invalid_subscription'
      end
    end

    subscription
  end

  def new_subscription_for_user
    @subscription = Subscription.new({
                                       description:      @subscription_plan.description,
                                       animal_id:        user.animals.last.id,
                                       subscribed_until: DateTime.now + 1.years
                                     })

    @subscription_plan.details.each do |detail|
      subscription.details.new({
                                 type:     detail['type'],
                                 quantity: detail['quantity']
                               })
    end
  end
end
