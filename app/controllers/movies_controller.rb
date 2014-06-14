class MoviesController < ApplicationController

	# before_action :confirm_logged_in
	before_action :set_movie, only: [:show, :edit, :update]

	RATINGS = %w(G PG PG-13 R NC-17)

	def index
		@movies = Movie.all
	end

	def show
		# @movie = Movie.find_by(:id => params[:id])
		Rails.logger.debug(@movie)
	end

	def edit
		# @movie = Movie.find_by(:id => params[:id])
	end

	def update
		# @movie = Movie.find_by(:id => params[:id])
		if @movie.update_attributes(save_movie_params)
			redirect_to movie_path(@movie), :notice => "Movie successfully updated!"
		else
			render :edit
		end
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.new(save_movie_params)
		if @movie.save
			redirect_to movie_path(@movie), notice: "Movie successfully created!"
		else
			render :new
		end
	end

	def destroy
		@movie = Movie.find_by(params[:id])
		@movie.destroy
		redirect_to movies_path, :alert => "Movie successfully deleted!"
	end

	private
	def save_movie_params
		params.require(:movie).permit(:title,:rating,:total_gross,:description,:released_on, :cast, :director, :duration, :image_file_name)
	end

	def set_movie
		@movie = Movie.find_by(:id => params[:id])
	end

end
