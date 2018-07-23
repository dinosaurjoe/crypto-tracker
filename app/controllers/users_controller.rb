class UsersController < ApplicationController
  def my_portfolio
    @user_cryptos = current_user.cryptos
    @user = current_user

    respond_to do |format|
      format.html { render :my_portfolio }
      format.js { render partial: 'cryptos/list.html' }
    end
  end

  def show
    @user = User.find(params[:id])
    @user_cryptos = @user.cryptos
  end
end
