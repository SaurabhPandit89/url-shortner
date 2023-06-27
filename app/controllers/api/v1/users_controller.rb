# frozen_string_literal: true

module Api
  module V1
    # Users controller to handle user related functionality
    class UsersController < ApplicationController
      # POST /api/v1/users
      def create
        user = User.new(user_params)
        if user.save
          render json: user, status: :created
        else
          render json: user.errors, status: :unprocessable_entity
        end
      end

      # POST /api/v1/retreive_token
      def retreive_token
        user = User.find_by_email(params[:email])
        if user.present? && user.authenticate(user_params[:password])
          generate_new_token(user) unless user.auth_token&.valid_token?
          render json: user
        else
          render json: { error: 'Invalid email/password !!' }, status: :unprocessable_entity
        end
      end

      private

      def generate_new_token(user)
        user.auth_token&.delete
        user.generate_auth_token
        user.save
      end

      def user_params
        params.permit(:email, :password, :password_confirmation)
      end
    end
  end
end
