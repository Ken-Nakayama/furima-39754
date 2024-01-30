class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_params)
  end

  def create
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_params)
    @order_shipping.item_id = @item.id
    if @order_shipping.valid?
      @order_shipping.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.fetch(:order_shipping, {}).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id)
  end

end
