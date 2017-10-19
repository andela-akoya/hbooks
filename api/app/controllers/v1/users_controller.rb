module V1
  class UsersController < ApplicationController
    skip_before_action :authorize_request, only: :signup
    before_action :check_email_availability,  only: :signup

    def create
      user = User.create!(user_params)
      auth_token = AuthenticateUser.new(user.username, user.password).call
      response = { message: Message.account_created, auth_token: auth_token }
      json_response(response, :created)
    end

    private
    
    def user_params
      params.permit(%i[username lastname firstname email password password_confirmation])
    end

    def check_email_availability
      if get_user 'email'.to_sym
        response = { message: Message.email_already_used }
        return json_response(response, :bad_request)
      end
      check_user_existence
    end

    def check_user_existence
      if get_user 'username'.to_sym
        response = { message: 'User already exist' }
        json_response(response, :bad_request)
      end
    end

    def get_user(attribute)
      query_params = {}
      query_params[attribute] = user_params[attribute]
      User.find_by(query_params)
    end
  end
end
