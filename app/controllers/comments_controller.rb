class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
    @product = Product.find(params[:product_id])

  end

  def create
    @product = Product.find(params[:product_id])
    @comment = Comment.new(comment_params)
    @comment.product = @product
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "评论成功"
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
