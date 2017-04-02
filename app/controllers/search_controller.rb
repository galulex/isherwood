class SearchController < ApplicationController
	def search
		if params[:term].nil?
			@reviews = []
		else
			term = params[:term]
			@reviews = Review.search term, fields: [:description], highlight:  true
		end
	end

end
