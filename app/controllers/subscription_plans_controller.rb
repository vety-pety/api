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
    # call payment service here. if it is success...
    find_subscription_plan
    find_user(params["_jsonapi"]["data"])
    service = SubscriptionService::Create.call(@current_user, @subscription_plan)

    if service.succeeded?
      render json: service.result #, include: params[:include], status: :created
    else
      render_service_errors(service)
    end
  end

  def find_subscription_plan
    @subscription_plan = SubscriptionPlan.find(params[:id])
  end

  def find_user(user_id)
    @current_user = User.find(user_id)
  end
end
