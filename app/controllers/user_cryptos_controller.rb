class UserCryptosController < ApplicationController
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  def create
    crypto = Crypto.find_by_ticker(params[:crypto])
    if crypto.blank?
      crypto = Crypto.new_from_lookup(params[:crypto])
      crypto.save
    end
    @user_crypto = UserCrypto.create(user: current_user, crypto: crypto)
    flash[:success] = "Crypto #{@user_crypto.crypto.name} was successfully added"

    render json: { response: flash[:success] }, status: :ok
  end

  def destroy
    crypto = Crypto.find(params[:id])
    @user_crypto = UserCrypto.where(user_id: current_user.id, crypto_id: crypto.id).first
    @user_crypto.destroy
    flash[:notice] = "Crypto was successfully removed from portfolio"
    redirect_to my_portfolio_path
  end
end
