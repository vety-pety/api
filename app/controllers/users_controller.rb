# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    # after create request normally we should build a form within and object, but it does not find it
    # since i dont have time to search all forms, assigning attributes i use manuel.
    attributes = params.to_enum.to_h['_jsonapi']['data']['attributes']
    # ideally we should permit params here.
    user = User.new({
                      name:               attributes['name'],
                      encrypted_password: attributes['password'],
                      email:              attributes['email'],
                      phone:              attributes['phone'],
                      is_subscribed:      attributes['is_subscribed']
                    })

    animal_attr = params['_jsonapi']['data']['relationships']['animals']['data'][0]['attributes']
    unless animal_attr.nil?
      user.animals.new({
                         name:    animal_attr['name'],
                         age:     animal_attr['age'],
                         species: animal_attr['species']
                       })
    end

    service = UserService::Create.call(user)

    if service.succeeded?
      render json: service.result # , include: params[:include], status: :created
    else
      render_service_errors(service)
    end
  end
end
