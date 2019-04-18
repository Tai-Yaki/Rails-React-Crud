class ProductsController < ApplicationController
  before_action :set_product, only: [ :update, :destroy ]
  
  def index
    @product = Product.all
    render json: @product
  end

  def create
    @product = Product.create(product_params)
    render json: @product
  end

  def update
    @product.update(product_params)
    render json: @product
  end

  def destroy
    if @product.destroy
      head :no_content, status: :ok
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.permit(:product)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
