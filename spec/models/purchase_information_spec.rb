require 'rails_helper'

RSpec.describe PurchaseInformation, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_information = FactoryBot.build(:purchase_information, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '購入できる場合' do
      it "全ての項目が正しく入力できれば購入できる" do
        expect(@purchase_information).to be_valid
      end
      it "building_nameは空でも保存できること" do
      @purchase_information.building_name = ''
        expect(@purchase_information).to be_valid
      end
    end
    end
    context '購入できない場合' do
    it 'post_codeが空では登録できない' do
      @purchase_information.post_code = ''
      @purchase_information.valid?
      expect(@purchase_information.errors.full_messages).to include "Post code can't be blank"
    end
    it 'post_codeにハイフンがなくては登録できない' do
      @purchase_information.post_code = '1234567'
      @purchase_information.valid?
      expect(@purchase_information.errors.full_messages).to include "Post code is invalid. Enter it as follows (e.g. 123-4567)"
    end
    it 'cityが空では登録できない' do
      @purchase_information.city = ''
      @purchase_information.valid?
      expect(@purchase_information.errors.full_messages).to include "City can't be blank"
    end
    it 'shipping areaが空では登録できない' do
      @purchase_information.shipping_area_id = 1
      @purchase_information.valid?
      expect(@purchase_information.errors.full_messages).to include "Shipping area can't be blank"
    end
    it 'addressが空では登録できない' do
      @purchase_information.address = ''
      @purchase_information.valid?
      expect(@purchase_information.errors.full_messages).to include "Address can't be blank"
    end
    it 'phone_numberが空では登録できない' do
      @purchase_information.phone_number = ''
      @purchase_information.valid?
      expect(@purchase_information.errors.full_messages).to include "Phone number can't be blank"
    end
    it 'phone_numberが短すぎては登録できない' do
      @purchase_information.phone_number = '0123'
      @purchase_information.valid?
      expect(@purchase_information.errors.full_messages).to include "Phone number is too short (minimum is 10 characters)"
    end
    it 'phone_numberが短12桁以上では登録できない' do
      @purchase_information.phone_number = '012345678901'
      @purchase_information.valid?
      expect(@purchase_information.errors.full_messages).to include "Phone number is too long (maximum is 11 characters)"
    end
    it 'phone_numberが数字でないと登録できない' do
      @purchase_information.phone_number = 'test'
      @purchase_information.valid?
      expect(@purchase_information.errors.full_messages).to include "Phone number is invalid. Input only number"
    end
    it "tokenが空では登録できないこと" do
      @purchase_information.token = nil
      @purchase_information.valid?
      expect(@purchase_information.errors.full_messages).to include("Token can't be blank")
    end
    it 'userが紐付いていないと保存できない' do
      @purchase_information.user_id = nil
      @purchase_information.valid?
      expect(@purchase_information.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐付いていないと保存できない' do
    @purchase_information.item_id = nil
    @purchase_information.valid?
    expect(@purchase_information.errors.full_messages).to include("Item can't be blank")
    end
  end
end
