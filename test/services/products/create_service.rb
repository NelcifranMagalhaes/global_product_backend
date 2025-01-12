require 'test_helper'

module Products
  class CreateServiceTest < ActiveSupport::TestCase
    setup do
      @file_path = 'test/fixtures/files/data.csv'
      @file = File.open(@file_path)
    end

    teardown do
      @file.close
    end

    test 'should create product with valid params' do
      Products::CreateService.new(@file).call
      assert_equal 8, Product.count
    end
  end
end
