require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できる場合' do
      it "全ての項目が正しく入力できれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
    it 'nameが空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end
    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it 'explanationが空では登録できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Explanation can't be blank"
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it 'categoryが空では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it 'conditionが空では登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition can't be blank"
    end
    it 'shipping areaが空では登録できない' do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping area can't be blank"
    end
    it 'shipping chargesが空では登録できない' do
      @item.shipping_charges_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping charges can't be blank"
    end
    it 'shipping daysが空では登録できない' do
      @item.shipping_days_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping days can't be blank"
    end
    it 'priceが半角数字でないと登録できない' do
      @item.price = 'test'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
    end
    it 'priceが300~9999999でないと登録できない' do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it 'priceが300~9999999でないと登録できない' do
      @item.price = '1234567890'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
end