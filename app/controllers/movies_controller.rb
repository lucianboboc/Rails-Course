class MoviesController < ApplicationController

	def index
		@movies = Movie.released
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

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.new(save_movie_params)
		@movie.save
		redirect_to movie_path(@movie)
	end

	def destroy
		@movie = Movie.find_by(params[:id])
		@movie.destroy
		redirect_to movies_path
	end

	private
	def save_movie_params
		params.require(:movie).permit(:title,:rating,:total_gross,:description,:released_on, :cast, :director, :duration, :image_file_name)
	end
end
