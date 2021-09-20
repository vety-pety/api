class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def render_service_errors(service)
    render json: { base: service.errors.uniq }, status: 422
  end
end
