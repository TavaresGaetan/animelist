class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    # get current user animes
    @animes = current_user.animes
    json_response(@animes)
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
    # add animes belonging to current user
    @anime = current_user.animes.create!(anime_params)
    json_response(@anime, :created)
  end


end
