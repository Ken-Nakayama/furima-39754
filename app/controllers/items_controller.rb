class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]

  def index
    @items = Item.order(created_at: :desc)
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless can_edit_item?(@item)
  end

  def update
    @item = Item.find(params[:id])
    redirect_to root_path unless can_edit_item?(@item)
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private
  def can_edit_item?(item)
    current_user && current_user.id == item.user_id
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

end
