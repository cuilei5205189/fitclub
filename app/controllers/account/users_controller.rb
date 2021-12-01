class Account::UsersController < Account::BaseController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save
      flash[:notice] = '用户资料更新成功'
      redirect_to edit_account_user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :truename ,:address, :phone, :avatar)
  end
end
