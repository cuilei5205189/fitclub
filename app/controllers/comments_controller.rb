class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
    @product = Product.find(params[:product_id])

  end

  def create
    @product = Product.find(params[:product_id])
    @comment = Comment.new(params[:comment].permit(:content))
    @comment.product = @product
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "评论成功"
      redirect_to product_path(@product)
    else
      redirect_to new_product_comment_path(@product), alert: @comment.errors.full_messages.join("\n")
    end
  end
end