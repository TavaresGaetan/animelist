module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authorize_request, only: :create
      before_action :set_user, only: [:show, :update, :destroy]

      # GET /users
      def index
      end

      # POST /users
      def create
        user = User.create!(user_params)
        auth_token = AuthenticateUser.new(user.name, user.password, user.rights).call
        response = { message: Message.account_created, auth_token: auth_token }
        json_response(response, :created)
      end

      # GET /users/:id
      def show
        json_response(@user)
      end

      # PUT /users/:id
      def update
        @user.update(user_params)
        head :no_content
      end

      # DELETE /users/:id
      def destroy
        @user.destroy
        head :no_content
      end

      private

      def user_params
        # whitelist params
        params.permit(
          :name,
          :password,
          :password_confirmation,
          :rights
        )
      end

      def set_user
        @user = User.find(params[:id])
      end

      def add
      end


    end
  end
end
