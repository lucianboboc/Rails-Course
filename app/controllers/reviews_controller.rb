class ReviewsController < ApplicationController
	def index
		@movie = Movie.where(:id => params[:movie_id]).first
		# @reviews = @movie.reviews
		@reviews = Review.where(movie_id: @movie.id)
	end

	def new
		@movie = Movie.where(:id => params[:movie_id]).first
		@review = @movie.reviews.new
	end

	def create
		@movie = Movie.where(:id => params[:movie_id]).first
		@review = @movie.reviews.new(review_params)
		if @review.save
			redirect_to movie_reviews_path(@movie), :notice => "Thanks for the review!"
		else
			render :new
		end
	end

	def review_params
		params.require(:review).permit(:name,:stars,:comment)
	end
end
