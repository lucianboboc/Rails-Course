require 'spec_helper'

describe "Creating a new movie" do

	it "saves the movie and shows the new movie's details" do

		visit new_movie_url

		click_link "Add New Movie"

		expect(current_path).to eq(new_movie_path)	

		fill_in "Title", with: "New title movie"
		fill_in "Description", with: "Superheroes saving the world from villains"
		# fill_in "Rating", with: "PG"
		select "PG-13", :from => "Rating"
		
		fill_in "Total gross", with: "75000000"
		

		fill_in "Cast", with: "The award-winning cast"
		fill_in "Director", with: "The ever-creative director"
		fill_in "Duration", with: "123 min"
		fill_in "Image file name", with: "a.png"

		click_button 'Create Movie'

		expect(current_path).to eq(movie_path(Movie.last))

		expect(page).to have_content("New title movie")


	end
	



	it "does not save the movie if it's invalid" do
		visit new_movie_url

		expect {
			click_button 'Create Movie'

		}.not_to change(Movie,:count)

		expect(current_path).to eq(movies_path)
		expect(page).to have_text('error')
	end

	it "saves the movie and shows the new movie's details" do
		visit new_movie_url


		click_link "Add New Movie"

		expect(current_path).to eq(new_movie_path)	

		fill_in "Title", with: "New title movie"
		fill_in "Description", with: "Superheroes saving the world from villains"
		# fill_in "Rating", with: "PG"
		select "PG-13", :from => "Rating"

		fill_in "Total gross", with: "75000000"
		

		fill_in "Cast", with: "The award-winning cast"
		fill_in "Director", with: "The ever-creative director"
		fill_in "Duration", with: "123 min"
		fill_in "Image file name", with: "a.png"

		click_button 'Create Movie'

		expect(page).to have_text("Movie successfully created!")
	end

end