require 'spec_helper'

describe "Editing a movie" do
  
  it "updates the movie and shows the movie's updated details" do
    movie = Movie.create(movie_attributes)

    visit movie_url(movie)

    click_link "Edit"

    expect(find_field("Title").value).to have_content(movie.title)

  end
  
end