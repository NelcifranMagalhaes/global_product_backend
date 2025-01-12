require 'test_helper'

module Prices
  class CreateServiceTest < ActiveSupport::TestCase
    setup do
      @product = products(:one)
      @usd_value = 1.0
      Prices::CreateService.new(@product, @usd_value).call
    end

    test 'should create price' do
      assert_equal 7, Price.count
    end

    test 'should create one Price with usd value' do
      assert_includes @product.prices.pluck(:currency), 'usd'
    end
  end
end
