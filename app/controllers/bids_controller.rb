class BidsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @bid = @product.bids.new(bid_params)
    @bid.user_id = current_user.id
    if @bid.save
      redirect_to @product, notice: "Ставка сделана"
    else
      render @product
    end
  end

  private

    def bid_params
      params.require(:bid).permit(:price)
    end
end
