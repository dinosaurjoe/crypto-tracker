class CryptosController < ApplicationController

  def search
    if params[:crypto]
      @crypto ||= Crypto.new_from_lookup(params[:crypto])
    end
    if @crypto
      @crypto.can_be_added = current_user.crypto?(@crypto.ticker)

      render json: @crypto, methods: [:can_be_added]
    else
      render status: 404, json: { response: 'No crypto exists for this symbol.' }
    end
  end
end
