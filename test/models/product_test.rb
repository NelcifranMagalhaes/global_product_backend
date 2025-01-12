require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  setup do
    @product = Product.new(name: 'Test Product', expiration: '2023-01-14')
  end

  test 'should be valid with valid attributes' do
    assert @product.valid?
  end

  test 'should be invalid without a name' do
    @product.name = nil
    assert_not @product.valid?
    assert_includes @product.errors[:name], "can't be blank"
  end

  test 'should be invalid without an expiration date' do
    @product.expiration = nil
    assert_not @product.valid?
    assert_includes @product.errors[:expiration], "can't be blank"
  end

  test 'should have many prices' do
    assert_respond_to @product, :prices
  end
end
