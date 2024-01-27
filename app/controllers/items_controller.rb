class ItemsController < ApplicationController
  #before_action :authenticate_user!

  def index
    @item = Item.all
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
    #@item = Item.new(item_params)
    @item = current_user.items.build(item_params)
    if params[:item][:image].present?
      if @item.save
        redirect_to root_path
      else
        # エラー時には、再度 new アクションを呼び出す前に入力済みの項目を保持
        render :new, status: :unprocessable_entity
      end
    else
      # エラー時には、再度 new アクションを呼び出す前に入力済みの項目を保持
      @item.errors.add(:image, "を選択してください")
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

end
