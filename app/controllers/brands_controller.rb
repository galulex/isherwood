class BrandsController < ApplicationController
  def index
    @brands = Brand.all
    featured_brand_ids = [1,2,5]
    @featured_brands = Brand.find(featured_brand_ids)
  end

  def show
    @brand = Brand.find(params[:id])
    @review = Review.find(params[:id])
  end
  
    def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(review_params)
  end
  
end
