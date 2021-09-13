class SubscriptionPlansController < ApplicationController
  def index
    render json: SubscriptionPlan.all
  end

  def show
    find_subscription_plan
    render json: @subscription_plan
  end

  private

  def find_subscription_plan
    @subscription_plan = SubscriptionPlan.find(params[:id])
  end
end
