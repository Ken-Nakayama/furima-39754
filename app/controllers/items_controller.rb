class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
    redirect_to root_path unless can_edit_item?(@item)
  end

  def update
    redirect_to root_path unless can_edit_item?(@item)
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if can_edit_item?(@item)
      @item.destroy
    end
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def can_edit_item?(item)
    current_user.id == item.user_id
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

end
