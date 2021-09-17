class SubscriptionPlansController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: SubscriptionPlan.all
  end

  def show
    find_subscription_plan
    render json: @subscription_plan
  end

  def make_payment
    binding.pry
    find_subscription_plan
  end

  private

  def find_subscription_plan
    @subscription_plan = SubscriptionPlan.find(params[:id])
  end
end
