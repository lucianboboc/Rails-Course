require 'spec_helper'

describe "Viewing an individual movie" do
	
	it "shows the movie's details" do

		movie = Movie.create(movie_attributes(total_gross: 300000000.00))

		visit "http://example.com/movies/#{movie.id}"

		expect(page).to have_text(movie.title)
		expect(page).to have_text(movie.rating)
		expect(page).to have_text("$300,000,000.00")
		expect(page).to have_text(movie.description)
		expect(page).to have_text(movie.released_on)
	end

	it "shows the total gross if the total gross exceeds $50M" do
		movie = Movie.create(movie_attributes(total_gross: 60000000.00))

		visit movie_path(movie)

		expect(page).to have_text("$60,000,000.00")
	end

	it "shows 'Flop!' if the total gross is less than $50M" do
		movie = Movie.create(movie_attributes(total_gross: 30000000.00))

		visit movie_path(movie)

		expect(page).to have_selector("img[src$='#{movie.image_file_name}']")

		expect(page).to have_text("Flop!")
	end

end