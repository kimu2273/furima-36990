class PurchaseInformation
  include ActiveModel::Model
  attr_accessor  :token, :post_code, :shipping_area_id, :city, :address, :building_name, :phone_number,  :user_id, :item_id

  with_options presence: true do
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
  validates :token,  :city, :shipping_area_id, :address,  :user_id, :item_id
  validates :shipping_area_id, numericality:  { other_than: 1 , message: "can't be blank"} 
  validates :phone_number,numericality: {with: /\A[0-9]+\z/, message: "is invalid. Input only number"}, length:{ in: 10..11,message:"is too short"}
  end


  def save
    binding.pry
    order = Order.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(post_code: post_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end