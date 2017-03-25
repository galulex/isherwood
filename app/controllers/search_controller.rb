class SearchController < ApplicationController
	def search
		if params[:term].nil?
			@reviews = []
		else
			term = params[:term]
			@reviews = Review.search term, fields: [:description], highlight:  true
		end
	end

	def typeahead
		render json: Review.search(params[:term], {
      fields: ["title"],
      limit: 10,
      load: false,
      misspellings: {below: 5},
    }).map do |review| { title: review.title, value: review.id } end
	end
end
