class ProductsController < ApplicationController
  def index
    if params[:category] 
      @products =  Category.find_by(id: params[:category]).products
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
