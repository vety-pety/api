class UserService::Create < ApplicationService

  attr_reader :user
  
  def initialize(user)
    @user = user
  end

  def call
    user.transaction(requires_new: true) do
      unless user.save!
        #fail with error need here.
        user.errors.add(:user, :save_error, message: "invalid user")
        raise "invalid_user"
      end
    end

    user
  end
end
