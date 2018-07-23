class CryptosController < ApplicationController

  def search
    if params[:stock]
      @crypto ||= Crypto.new_from_lookup(params[:crypto])
    end
    if @crypto
      @crypto.can_be_added = current_user.can_add_stock?(@crypto.ticker)

      render json: @crypto, methods: [:can_be_added]
    else
      render status: 404, json: { response: 'No crypto exists for this symbol.' }
    end
  end
end
