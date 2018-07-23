class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_cryptos
  has_many :cryptos, through: :user_cryptos

 def crypto_already_added?(ticker_symbol)
    crypto = Crypto.find_by_ticker(ticker_symbol)
    return false unless crypto
    user_cryptos.where(crypto_id: crypto.id).exists?
  end

  def under_crypto_limit?
    (user_cryptos.count < 10)
  end

  def can_add_crypto?(ticker_symbol)
    under_crypto_limit? && !crypto_already_added?(ticker_symbol)
  end

  def except_current_user(users)
    users.reject { |user| user.id == self.id }
  end

end
