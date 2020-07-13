class AccountsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(resources_params)
    user.save
    redirect_to new_account_path
  end

  private

  def resources_params
    params.require(:user).permit(:name, :username, :password)
  end
end
