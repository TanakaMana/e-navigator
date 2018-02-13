class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update]

  def index
  end

  def edit
  end

  def update
    if @user.update!(update_params)
      redirect_to edit_user_path, notice: "保存しました"
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def update_params
    params.require(:user).permit(
      :email,
      :name,
      :birthday,
      :gender,
      :school
    )
  end
end
