require 'test_helper'

class PriceTest < ActiveSupport::TestCase
  setup do
    @product = products(:one)
    @price = Price.new(value: 100, currency: 'USD', product: @product)
  end

  test 'should be valid with valid attributes' do
    assert @price.valid?
  end

  test 'should be invalid without an value' do
    @price.value = nil
    assert_not @price.valid?
    assert_includes @price.errors[:value], "can't be blank"
  end

  test 'should be invalid with a negative value' do
    @price.value = -1
    assert_not @price.valid?
    assert_includes @price.errors[:value], 'must be greater than or equal to 0'
  end

  test 'should be invalid without a currency' do
    @price.currency = nil
    assert_not @price.valid?
    assert_includes @price.errors[:currency], "can't be blank"
  end

  test 'should belong to a product' do
    assert_respond_to @price, :product
  end
end
