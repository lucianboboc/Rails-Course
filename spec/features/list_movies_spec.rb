require 'spec_helper'

describe "View the list of movies" do
	it "show the movies" do

		movie1 = Movie.create(title: "Iron Man",
		                      rating: "PG-13",
		                      total_gross: 318412101.00,
		                      description: "Tony Stark builds an armored suit to fight the throes of evil",
		                      released_on: "2008-05-02")

		movie2 = Movie.create(title: "Superman",
		                      rating: "PG",
		                      total_gross: 134218018.00,
		                      description: "Clark Kent grows up to be the greatest super-hero",
		                      released_on: "1978-12-15")

		movie3 = Movie.create(title: "Spider-Man",
		                      rating: "PG-13",
		                      total_gross: 403706375.00,
		                      description: "Peter Parker gets bit by a genetically modified spider",
		                      released_on: "2002-05-03")

		movie4 = Movie.create(title: "Catwoman",
							    rating: "PG-13",
							    total_gross: 40200000.00,
							    description: "Patience Philips has a more than respectable career as a graphic designer",
							    released_on: "2004-07-23")

		visit movies_url

		expect(page).to have_text("4 Movies")
		expect(page).to have_text(movie1.title)
		expect(page).to have_text(movie2.title)
		expect(page).to have_text(movie3.title)
		expect(page).to have_text(movie4.title)

		expect(page).to have_text(movie1.rating)
	end
end