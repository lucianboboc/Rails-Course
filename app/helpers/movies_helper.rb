module MoviesHelper
	def format_total_gross(movie)
		if(movie.flop?)
			content_tag(:strong, "Flop!")
		else
			number_to_currency(movie.total_gross)
		end
	end

	def image_for_movie(movie)
		if movie.image_file_name.blank?
			image_tag('default.png')
		else
			image_tag(movie.image_file_name)
		end
	end
end
