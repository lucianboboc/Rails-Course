require 'spec_helper'

describe "View the list of movies" do
	it "show the movies" do

		visit "http://example.com/movies"

		expect(page).to have_text("2 Movies")

	end
end