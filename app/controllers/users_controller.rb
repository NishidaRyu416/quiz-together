class UsersController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update]
  before_action :user_data

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Quiz-together by Ryu Nishida"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params )
      flash[:success] = "Completion!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def set_params
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,:local ,:profile)
  end
end
