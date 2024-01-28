class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    #@item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if params[:item][:image].present? && @item.save
      redirect_to root_path
    else
      @item.errors.add(:image, "を選択してください")
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

end
