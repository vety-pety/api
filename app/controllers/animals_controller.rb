class AnimalsController < ApplicationController
  def index
    render json: Animal.all  # (current_user.animals)
  end
end
