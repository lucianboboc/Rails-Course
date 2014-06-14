# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


movie = Movie.create(title: "TEST Man",
        rating: "PG-13",
        total_gross: 318412101.00,
        description: "Tony Stark builds an armored suit to fight the throes of evil",
        released_on: "2008-05-02",
        cast: "Robert Downey Jr., Gwyneth Paltrow and Terrence Howard",
    	director: "Jon Favreau",
    	duration: "126 min",
    	image_file_name: "a.png")