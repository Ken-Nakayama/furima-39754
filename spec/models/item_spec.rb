require 'rails_helper'

RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '新規登録できるとき' do
      it '全てのカラムが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できないとき' do

      it 'userが紐づいていない場合登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'sales_status_idが空では登録できない' do
        @item.sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end

      it 'shipping_fee_status_idが空では登録できない' do
        @item.shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end

      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'scheduled_delivery_idが空では登録できない' do
        @item.scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end

      it 'category_idが未選択項目では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'sales_status_idが未選択項目では登録できない' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end

      it 'shipping_fee_status_idが未選択項目では登録できない' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end

      it 'prefecture_idが未選択項目では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'scheduled_delivery_idが未選択項目では登録できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが全角文字を含むと登録できない' do
        @item.price = 'あいう123'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input a number between 300 and 9,999,999")
      end

      it 'priceが英字のみでは登録できない' do
        @item.price = 'abcdef'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input a number between 300 and 9,999,999")
      end

      it 'priceが299以下では登録できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input a number between 300 and 9,999,999")
      end

      it 'priceが10000000以上では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input a number between 300 and 9,999,999")
      end

    end
  end
end
