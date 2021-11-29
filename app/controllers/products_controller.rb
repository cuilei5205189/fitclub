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

  def add_to_cart
    @quantity = params[:quantity].to_i
    if params[:commit] == "加入购物车"
      if current_cart.products.include?(@product)
        redirect_to product_path(@product)
        flash[:warning] = "你的购物车内已有此物品"
      elsif @quantity <= @product.quantity # 如果输入的数量小于库存
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
end
