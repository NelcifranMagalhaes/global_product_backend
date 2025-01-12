class ProductsController < ApplicationController
  # POST /upload_products
  def upload_products
    Products::CreateService.new(product_params).call
    render json: { message: 'Products uploaded successfully' }, status: 200
  end

  def index
    ransack_search = Product.includes(:prices).ransack(params[:q])
    products = ransack_search.result.order(sort_params).page(params[:page]).per(10)
    render json: products.as_json(include: :prices), status: 200
  end

  def destroy
    Price.destroy_all
    Product.destroy_all
    render json: { message: 'Products and Prices deleted successfully' }, status: 200
  end

  private

    def product_params
      params.require(:products)
    end

    def sort_params
      params[:sort] || 'created_at desc'
    end
end
