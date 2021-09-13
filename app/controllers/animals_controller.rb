class AnimalsController < ApplicationController
  def index
    render jsonapi: Animal.all
  end
end
