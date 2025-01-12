module Requests
  class ExchangeApi
    def all_currencies
      url = 'https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/currencies.json'
      response = URI.open(url).read
      JSON.parse(response)
    end

    def specific_currency(currency)
      url = "https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/currencies/#{currency}.json"
      response = URI.open(url).read
      json_parsed = JSON.parse(response)
      json_parsed[currency]
    end
  end
end
