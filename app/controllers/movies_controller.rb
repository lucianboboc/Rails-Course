class MoviesController < ApplicationController

	def index
		@movies = Movie.all
	end

	def show
		@movie = Movie.find_by(:id => params[:id])
		Rails.logger.debug(@movie)
	end

	def edit
		@movie = Movie.find_by(:id => params[:id])
	end

	def update
		@movie = Movie.find_by(:id => params[:id])
		@movie.update_attributes(save_movie_params)
		
		redirect_to movie_path(@movie)
	end

	private
	def save_movie_params
		params.require(:movie).permit(:title,:rating,:total_gross,:description,:released_on)
	end
end
