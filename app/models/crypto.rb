class Crypto < ApplicationRecord
  require 'net/http'

  has_many :user_cryptos
  has_many :users, through: :user_cryptos

  attr_accessor :can_be_added

  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end

  def self.new_from_lookup(ticker_symbol)
    source = "https://min-api.cryptocompare.com/data/top/exchanges/full?fsym=#{ticker_symbol}&tsym=USD"
    resp = Net::HTTP.get_response(URI.parse(source))
    data = resp.body
    looked_up_crypto = JSON.parse(data)['Data']

    return nil unless looked_up_crypto['CoinInfo']['FullName']
    new_crypto = new(ticker: looked_up_crypto['CoinInfo']['Name'], name: looked_up_crypto['CoinInfo']['FullName'])
    new_crypto.last_price = looked_up_crypto['AggregatedData']['Price']
    new_crypto
  end

end
