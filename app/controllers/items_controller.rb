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

  def create
    @item = Item.new(item_params)

    if @item.save
      # データベースへの保存が成功した場合の処理（例: リダイレクト）
      redirect_to @item
    else
      render :new
    end

  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end

end
