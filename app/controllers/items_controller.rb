class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.all.order("created_at DESC")
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if user_signed_in?&& current_user.id == @item.user_id
      edit_item_path(@item.id)
    elsif user_signed_in?
      redirect_to root_path
    else
      redirect_to new_user_session_path
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :condition_id,:shipping_area_id,:shipping_charges_id,:shipping_days_id, :price).merge(user_id: current_user.id)
  end

end
