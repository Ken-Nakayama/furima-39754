class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    @categories = Category.all
    @sales_status = SalesStatus.all
    @shipping_fee_status = ShippingFeeStatus.all
    @prefecture = Prefecture.all
    @scheduled_delivery = ScheduledDelivery.all
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      # エラー時には、再度 new アクションを呼び出す前に入力済みの項目を保持
      @item.name = params[:item][:name]
      @item.description = params[:item][:description]
      @item.category_id = params[:item][:category_id]
      @item.sales_status_id = params[:item][:sales_status_id]
      @item.shipping_fee_status_id = params[:item][:shipping_fee_status_id]
      @item.prefecture_id = params[:item][:prefecture_id]
      @item.scheduled_delivery_id = params[:item][:scheduled_delivery_id]
      @item.price = params[:item][:price]
      render :new
    end

  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

end
