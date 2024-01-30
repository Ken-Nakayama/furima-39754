require 'rails_helper'

RSpec.describe OrderShipping, type: :model do

  before do
    @order_shipping = FactoryBot.build(:order_shipping)
  end

  describe '商品購入機能' do
    context '新規登録できるとき' do
      it '全てのカラムが存在すれば登録できる' do
        expect(@order_shipping).to be_valid
      end
    end
  end

end
