require 'rails_helper'
describe OrderAddress do
  before do
    @item = FactoryBot.create(:item) # 購入された商品
    @user = FactoryBot.create(:user) # 購入者
    @order_address = FactoryBot.build(:order_address, item_id: @item.id, user_id: @user.id)
    sleep(0.05) # 早すぎるとエラーが発生するため
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
        expect(@order_address.errors.full_messages).to include('郵便番号を入力してください')
        # expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンがないとだと登録できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号が間違えています. ハイフンを入れてください')
        # expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'postal_codeに「半角数字3桁 - 半角数字4桁」でないとだと登録できない' do
        @order_address.postal_code = '123-456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号が間違えています. ハイフンを入れてください')
        # expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefectureが空だと登録できない' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('都道府県を入力してください')
        # expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefectureが「--」だと登録できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('都道府県を選択してください')
        # expect(@order_address.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'cityが空だと登録できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('市区町村を入力してください')
        # expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'street_addressが空だと登録できない' do
        @order_address.street_address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('番地を入力してください')
        # expect(@order_address.errors.full_messages).to include("Street address can't be blank")
      end

      it 'phone_numberが空だと登録できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号を入力してください')
        # expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが全角文字だと登録できない' do
        @order_address.phone_number = '０９０１２３４５６７８９'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は数値で入力してください')
        # expect(@order_address.errors.full_messages).to include('Phone number is not a number')
      end

      it 'phone_numberが英数混合だと登録できない' do
        @order_address.phone_number = '123abc'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は数値で入力してください')
        # expect(@order_address.errors.full_messages).to include('Phone number is not a number')
      end

      it 'phone_numberが11桁以下でないと登録できない' do
        @order_address.phone_number = '123_456_789_012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は11文字以内で入力してください')
        # expect(@order_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end

      it 'tokenが空だと登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('クレジットカード情報が正しくありません')
        # expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空だと登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('ユーザーを入力してください')
        # expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('商品を入力してください')
        # expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
