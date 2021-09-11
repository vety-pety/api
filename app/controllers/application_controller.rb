class ApplicationController < ActionController::API
  skip_before_action :verify_authenticity_token

  def current_user
    @current_user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
