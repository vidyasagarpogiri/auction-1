class ProductsController < ApplicationController
  def index
    @products = Product.paginate(page: params[:page])
  end

  def new
    @product = current_user.products.new
  end

  def create
    @product = current_user.products.new(product_params)

    if @product.save
      redirect_to @product, notice: "Предложение создано"
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to @product, notice: 'Предложание сохранено'
    else
      render 'edit'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
  end



  private

    def product_params
      params.require(:product).permit(:title, :price, :step, :start_at, :duration, :description)
    end
end
