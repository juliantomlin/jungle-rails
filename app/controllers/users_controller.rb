class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def login
    @user = User.all
    redirect_to [:products], notice: 'Logged In!'
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to [:products], notice: 'Registered!'
    else
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :e_mail,
      :password
    )
  end

end
