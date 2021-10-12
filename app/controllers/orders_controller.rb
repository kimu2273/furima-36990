class OrdersController < ApplicationController
  def index
    @purchase_information = PurchaseInformation.new
    @item = Item.find(params[:item_id])
  end

  def new
    @purchase_information = PurchaseInformation.new
  end

  def create
    @purchase_information = PurchaseInformation.new(purchase_information_params)
    @item = Item.find(params[:item_id])
    if  @purchase_information.valid?
      pay_item
      @purchase_information.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def purchase_information_params
    params.require(:purchase_information).permit(:post_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :order).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_information_params[:token], 
      currency: 'jpy' 
    )
  end

end
