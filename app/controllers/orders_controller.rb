class OrdersController < ApplicationController
  before_action :set_item, only: [:index]


  def index
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      @order_shipping.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_shipping).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
