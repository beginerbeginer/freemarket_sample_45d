class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update]
  before_action :set_product, only: [:show, :edit, :update]
  AlreadyMaximumPostedPhotos = 4

  def index
    @categories = Category.limit(3)
    @brands = Brand.limit(4)
    @first_categories = Category.where(ancestry: nil)
  end

  def new
    @product = Product.new
    @product.product_images.build
  end

  def show
    @images = @product.product_images.limit(4)
    @products = ProductDecorator.decorate_collection(@product.user.products.where.not(id: params[:id]).limit(6))
    @category_products = ProductDecorator.decorate_collection(@product.third_category.third_category_products.where.not(id: params[:id]).limit(6))
    if user_signed_in?
      @like = Like.find_by(user_id: current_user.id, product_id: params[:id])
    end
    @prev_item = @product.showPrevItem if @product.checkPrevItem
    @next_item = @product.showNextItem if @product.checkNextItem
  end

  def create
    @product = Product.new(product_parameter)
    respond_to do |format|
      if @product.save
        params[:product_images][:image].each do |image|
          @product_image = @product.product_images.create(image: image, product_id: @product.id)
        end
        format.html{redirect_to root_path}
      else
        format.html{render action: 'new'}
      end
    end
  end

  def edit
  end

  def update
    if @product.user_id == current_user.id
      @product.update(update_parameter)
      redirect_to listing_path(@product)
    else
      render 'edit'
    end
  end

  private

  def set_product
    @product = ProductDecorator.decorate(Product.find(params[:id]))
  end

  def product_parameter
    params.require(:product).permit(:name, :description, :first_category_id, :second_category_id, :third_category_id, :size, :product_status, :delivery_fee, :prefecture_id, :lead_time, :price, :transaction_status, product_images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def update_parameter
    params.require(:product).permit(:name, :description, :first_category_id, :second_category_id, :third_category_id, :size, :product_status, :delivery_fee, :prefecture_id, :lead_time, :price, :transaction_status, product_images_attributes: [:image, :id])
  end
end
