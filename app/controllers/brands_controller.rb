class BrandsController < ApplicationController
  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.friendly.find(params[:id])
  end
  
    def new  
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(review_params)
  end
  
end
