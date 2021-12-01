class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :add_to_cart, :pay_now, :collect, :un_collect]
  before_action :authenticate_user! , only: [:collect, :un_collect]
  before_action :validate_search_key, only: [:search]
  def index
    if params[:category] 
      @products =  Category.find_by(id: params[:category]).products
    else
      @products = Product.published
    end
  end

  def show
  end

  def search
    if @query_string.present?
      search_result = Product.ransack(@search_criteria).result(:distinct => true)
      @products = search_result
    end
  end

  def collect
    if !current_user.is_collect_of?(@product)
      current_user.collect!(@product)
    else
      flash[:warning] = "你已经收藏过该商品了"
    end

  end

  def un_collect
    if current_user.is_collect_of?(@product)
      current_user.un_collect!(@product)
    else
      flash[:warning] = "你还没有收藏该商品"
    end
    redirect_to product_path(@product)
   end

  def add_to_cart
    @product = Product.published.find(params[:id])
    @quantity = params[:quantity].to_i
        
    if params[:commit] == "加入购物车"
      if current_cart.products.include?(@product)
        redirect_to product_path(@product)
        flash[:warning] = "你的购物车内已有此物品"
      elsif @quantity <= @product.quantity
        current_cart.add_product_to_cart(@product, @quantity)
        flash[:notice] = "成功加入购物车"
        redirect_to product_path(@product)
      else
        redirect_to product_path(@product)
        flash[:warning] = "库存不足"
      end

    elsif params[:commit] == "立即购买"
      if !current_cart.products.include?(@product)
        current_cart.add_product_to_cart(@product, @quantity)
        redirect_to carts_path
      else
        flash[:warning] = "你的购物车内已有此物品"
        redirect_to carts_path
      end
    end

  end

  protected

  def validate_search_key
    @query_string = params[:query].gsub(/\\|\'|\/|\?/, "") if params[:query].present?
    @search_criteria = search_criteria(@query_string)
  end


  def search_criteria(query_string)
    { :title_or_description_cont => query_string }
  end

  def find_product
    @product = Product.published.find(params[:id])
  end
end
