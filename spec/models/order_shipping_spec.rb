require 'rails_helper'

RSpec.describe OrderShipping, type: :model do

  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_shipping = FactoryBot.build(:order_shipping, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it '全てのカラムが存在すれば登録できる' do
        expect(@order_shipping).to be_valid
      end
      it '建物名が空でも登録できる' do
        @order_shipping.building = ''
        expect(@order_shipping).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it 'user_idが紐づいていない場合登録できない' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが紐づいていない場合登録できない' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end

      it 'postal_codeが空では登録できない' do
        @order_shipping.postal_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが3桁ハイフン4桁でないと登録できない' do
        @order_shipping.postal_code = '123-456７'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code should be in the format xxx-xxxx")
      end

      it 'prefecture_idが空では登録できない' do
        @order_shipping.prefecture_id = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idがデフォルト(1)では登録できない' do
        @order_shipping.prefecture_id = 1
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では登録できない' do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では登録できない' do
        @order_shipping.address = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では登録できない' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9桁以下では登録できない' do
        @order_shipping.phone_number = '123456789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number should be 10 to 11 digits")
      end

      it 'phone_numberが12桁以上では登録できない' do
        @order_shipping.phone_number = '123456789012'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number should be 10 to 11 digits")
      end

      it 'phone_numberが全角では登録できない' do
        @order_shipping.phone_number = 'テスト'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number should be 10 to 11 digits")
      end

      it 'phone_numberが半角数字以外では登録できない' do
        @order_shipping.phone_number = 'XXXXXXXXXX'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number should be 10 to 11 digits")
      end

      it 'tokenが空では登録できない' do
        @order_shipping.token = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end

    end

  end
end
