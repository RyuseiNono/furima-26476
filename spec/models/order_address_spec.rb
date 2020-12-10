require 'rails_helper'
describe OrderAddress do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入' do
    context '購入がうまくいくとき' do
      it '全ての情報が正しく入力されているとき' do
        expect(@order_address).to be_valid
      end

      it '建物名以外の情報が正しく入力されているとき' do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'postal_codeが空だと登録できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンがないとだと登録できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'postal_codeに「半角数字3桁 - 半角数字4桁」でないとだと登録できない' do
        @order_address.postal_code = '123-456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefectureが空だと登録できない' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと登録できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'street_addressが空だと登録できない' do
        @order_address.street_address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street address can't be blank")
      end

      it 'street_addressが空だと登録できない' do
        @order_address.street_address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street address can't be blank")
      end

      it 'phone_numberが空だと登録できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが半角数字でないと登録できない' do
        @order_address.phone_number = '０９０１２３４５６７８９'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is not a number')
      end

      it 'phone_numberが11桁以下でないと登録できない' do
        @order_address.phone_number = 123_456_789_012
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end

      it 'tokenが空だと登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
