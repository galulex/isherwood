class BrandsController < ApplicationController
  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find(params[:id])
    @reviews =Review.find(params[:id])
  end
  
    def new  
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(review_params)
  end
  
end
