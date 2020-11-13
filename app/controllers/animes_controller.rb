class AnimesController < ApplicationController
    before_action :set_user_anime, only: [:show, :update, :destroy]
  
    # GET /animes
    def index
      @animes = Anime.all
      json_response(@animes)
    end
  
    # GET /animes/:id
    def show
      json_response(@anime)
    end
  
    # POST /animes
    def create
      @anime = Anime.create!(anime_params)
      json_response(@anime, :created)
    end
  
    # PUT /animes/:id
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
      params.permit(:title, :author, :genre, :rating, :releasedate, :episodenumber, :image  )
    end

    def set_anime
      @anime = Anime.find(params[:id])
    end
end
