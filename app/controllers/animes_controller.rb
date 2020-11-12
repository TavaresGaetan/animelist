class AnimesController < ApplicationController
    before_action :set_user
    before_action :set_user_anime, only: [:show, :update, :destroy]
  
    # GET /users/:user_id/animes
    def index
      json_response(@user.animes)
    end
  
    # GET /users/:user_id/animes/:id
    def show
      json_response(@anime)
    end
  
    # POST /users/:user_id/animes
    def create
      @user.animes.create!(anime_params)
      json_response(@user, :created)
    end
  
    # PUT /users/:user_id/animes/:id
    def update
      @anime.update(anime_params)
      head :no_content
    end
  
    # DELETE /users/:user_id/animes/:id
    def destroy
      @anime.destroy
      head :no_content
    end
  
    private
  
    def anime_params
      params.permit(:name, :done)
    end
  
    def set_user
      @user = User.find(params[:user_id])
    end
  
    def set_user_anime
      @anime = @user.animes.find_by!(id: params[:id]) if @user
  end
end
