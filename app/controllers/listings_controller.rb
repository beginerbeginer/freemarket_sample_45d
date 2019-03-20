class ListingsController < ApplicationController
  MaximumPostedPhotos = 4
  before_action :set_product, only: [:show, :destroy]

  def index
    @products = Product.listing.where(user_id: current_user.id).reverse_order
  end

  def show
    @images = @product.product_images.limit(4)
  end

  def destroy
    if @product.user_id == current_user.id
      @product.destroy
      redirect_to user_listings_path user_id: current_user.id
    else
      redirect_to user_listings_path user_id: current_user.id
    end
  end

  def in_progress
    @products = Product.in_progress.where(user_id: current_user.id).reverse_order
  end
  def solds
    @products = Product.sold.where(user_id: current_user.id).reverse_order
  end

  private

  def set_product
    @product = ProductDecorator.decorate(Product.find(params[:id]))
  end
end
