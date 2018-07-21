class CryptosController < ApplicationController

  require 'net/http'

  source = "https://min-api.cryptocompare.com/data/price?fsym=ADA&tsyms=BTC,USD,EUR"
  resp = Net::HTTP.get_response(URI.parse(source))
  data = resp.body
  result = JSON.parse(data)

  def search
  end
end
