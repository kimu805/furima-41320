class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root_path, only: :index

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_delivery = PurchaseDelivery.new
    set_item
  end

  def create
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    set_item
    if @purchase_delivery.valid?
      pay_item
      @purchase_delivery.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private
  def purchase_params
    params.require(:purchase_delivery).permit(:post_code, :prefecture_id, :municipal, :street, :building, :call).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: "jpy"
    )
  end

  def move_to_root_path
    set_item
    if current_user.id == @item.user.id || !(@item.purchase == nil)
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
