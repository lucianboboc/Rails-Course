class MoviesController < ApplicationController

	def index
		@movies = Movie.all
	end

	def show
		@movie = Movie.find_by(:id => params[:id])
		Rails.logger.debug(@movie)
	end
end
