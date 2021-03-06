class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  def index
    @item = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
    if @item.order.present?
      redirect_to root_path
    end
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    unless  current_user.id == @item.user_id
      redirect_to root_path
    else
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :condition_id,:shipping_area_id,:shipping_charges_id,:shipping_days_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
