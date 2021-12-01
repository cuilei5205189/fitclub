class Admin::ProductsController < Admin::BaseController
  before_action :find_product , only: [:show, :hide, :publish, :edit, :update, :destroy, :move_up, :move_down, :published ]

  def index
    @products = Product.all
  end
  
  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
      flash[:notice] = "创建商品成功"
    else
      flash[:alert] = "创建商品失败, " + @product.errors.full_messages.join(',')
      redirect_to new_admin_product_path(@product)
    end
  end

  def edit
  end

  def update
    @product.category_id = params[:category_id]

    if @product.update(product_params)
      redirect_to admin_products_path
      flash[:notice] = "更新商品信息成功"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, alert:'已删除商品'
  end

  def move_up
    @product.move_higher
    redirect_to admin_products_path, alert:'已将商品上移'
  end

  def move_down
    @product.move_lower
    redirect_to admin_products_path, alert:'已将商品下移'
  end

  def hide
    @product.hide!
    redirect_to admin_products_path, alert:'已将商品隐藏'
  end

  def publish
    @product.publish!
    redirect_to admin_products_path, alert:'已将商品发布'
  end

  private

  def product_params
    params.require(:product).permit(:description,:title,:quantity,:price,:image,:is_public,:discount,:category_id)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
