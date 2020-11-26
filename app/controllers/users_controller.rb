class UsersController < ApplicationController
  before_action :permit_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "ユーザを登録しました"
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def permit_user
    if current_user.id != User.find_by(id: params[:id]).id
      redirect_to root_path, notice: "他ユーザの編集はできません"
    end
  end
end
