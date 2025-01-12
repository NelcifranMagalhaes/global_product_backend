require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test 'should get index' do
    get products_url, as: :json
    assert_response :success
    assert_not_nil json_response
  end

  test 'should upload products from CSV' do
    file = fixture_file_upload('test/fixtures/files/data.csv', 'text/csv')
    post upload_products_url, params: { products: file }, headers: { 'Content-Type' => 'multipart/form-data' }
    assert_response :success
    assert_equal 'Products uploaded successfully', json_response['message']
  end

  test 'should not upload CSV with wrong params' do
    file = fixture_file_upload('test/fixtures/files/data.csv', 'text/csv')
    post upload_products_url, params: { file: file }, headers: { 'Content-Type' => 'multipart/form-data' }
    assert_response :bad_request
  end

  test 'should destroy products and prices' do
    assert_difference('Product.count', -Product.count) do
      assert_difference('Price.count', -Price.count) do
        delete products_url, as: :json
      end
    end
    assert_response :success
    assert_equal 'Products and Prices deleted successfully', json_response['message']
  end

  private

  def json_response
    JSON.parse(response.body)
  end
end
