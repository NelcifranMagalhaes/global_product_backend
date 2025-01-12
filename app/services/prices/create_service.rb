require 'open-uri'
require 'json'

module Prices
  class CreateService
    def initialize(product, usd_value)
      @product= product
      @usd_value = usd_value
    end

    def call
      get_currencies
      save_usd_price
      4.times { create_price }
    end

    private

    def save_usd_price
      @product.prices.create!(
        value: @usd_value,
        currency: 'usd'
      )
    end

    def get_currencies
      @response_currencies = Requests::ExchangeApi.new.all_currencies
    end

    def create_price
      random_value = @response_currencies.keys.sample
      response_specific_currency = Requests::ExchangeApi.new.specific_currency(random_value)
      if response_specific_currency.key?('usd')
          value = calculate_value(@usd_value, response_specific_currency['usd'])
          @product.prices.create!(
            value: value,
            currency: random_value
          )
      end
    end

    def calculate_value(usd_value, currency_tax)
      (usd_value * currency_tax.round(7)).round(7) # 7 is a magic number
    end
  end
end
