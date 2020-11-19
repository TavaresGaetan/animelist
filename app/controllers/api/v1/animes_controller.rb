module Api
  module V1
    class AnimesController < ApplicationController
      before_action :set_anime, only: [:show, :update, :destroy]

      # GET /animes
      def index
				if params[:title]
					@animes = Anime.search_by_term(params[:title])
				elsif params[:author]
					@animes = Anime.search_by_term(params[:author])
				elsif params[:genre]
					@animes = Anime.search_by_term(params[:genre])
				elsif params[:rate_sup]
					@animes = Anime.where("rating >= ?", params[:rate_sup]) 
				elsif params[:rate_inf]
					@animes = Anime.where("rating <= ?", params[:rate_inf]) 
				elsif params[:episode_sup]
					@animes = Anime.where("episodenumber >= ?", params[:episode_sup]) 
				elsif params[:episode_inf]
					@animes = Anime.where("episodenumber <= ?", params[:episode_inf]) 
				elsif params[:date_sup]
					@animes = Anime.where("releasedate >= ?", params[:date_sup]) 
				elsif params[:date_inf]
					@animes = Anime.where("releasedate <= ?", params[:date_inf]) 
				else
					@animes = Anime.all
				end
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
  end
end
