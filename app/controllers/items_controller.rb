class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    @categories = Category.all
    @sales_status = Sales_Status.all
    @shipping_fee_status = Shipping_Fee_Status.all
    @prefecture = Prefecture.all
    @scheduled_delivery = Scheduled_Delivery.all
  end

  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end

end
