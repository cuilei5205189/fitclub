class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_items
  has_many :products, through: :cart_items, source: :product

  def add_product_to_cart(product,quantity)
    
    # binding.pry
    
    ci = cart_items.build
    ci.product = product
    ci.quantity = quantity
    ci.save
  end

  def merge!(cart)
    cart.cart_items.each do |item|
      add_product_to_cart(item.product, item.quantity)
    end
  end

  def clean!
    cart_items.destroy_all
  end

  def total_price
    sum = 0
    cart_items.each do |cart_item|
      if cart_item.product.price.present?
        sum += cart_item.quantity * cart_item.product.price
      end
    end
    sum
  end
end
