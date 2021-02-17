class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :creates]
  # before_action :check_admin, only: [:new, :edit, :update, :destroy]
  # skip_before_action :authenticate_user!, only: [:index, :show]

  def edit
    #получаю nil
    @users = current_user.id
    @adverts_active = current_user.adverts.where(status: 'active')
    @adverts_inactive = current_user.adverts.where(status: 'inactive')
  end

  def create
    @user = User.new(user_params)
    #render :new unless @user.save!
    sign_in(@user, bypass: true) if @user == current_user
    redirect_to users_path, notice: 'User was successfully created.'
  end

  def update
    if 
      @user.update_attributes(user_params)
      redirect_to users_path, success: 'Категория успешно обновлена'
    else
      format.html { render :edit }
    end
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :role, :some_parameter)
  end
end
