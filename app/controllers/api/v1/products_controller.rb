class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    render json: @product, except: :image
  end
end
