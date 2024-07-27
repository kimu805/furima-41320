class PurchasesController < ApplicationController
  def index
    @purchase_delivery = PurchaseDelivery.new
  end

  def create
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid?
      @purchase_delivery.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def purchase_params
    params.require(:purchase_delivery).permit(:post_code, :prefecture_id, :municipal, :street, :building, :call).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
