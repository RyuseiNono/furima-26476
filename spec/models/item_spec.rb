require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品' do
    context '出品がうまくいくとき' do
      it 'image,name,infomation,category,status_id,category_id,shipping_cost_id,prefecture_id,days_to_ship_id,priceが入力されている時' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'nameが40文字以上だと登録できない' do
        @item.name = Faker::Lorem.paragraph_by_chars(number: 50)
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end

      it 'informationが空だと登録できない' do
        @item.information = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end

      it 'nameが40文字以上だと登録できない' do
        @item.information = Faker::Lorem.paragraph_by_chars(number: 1010)
        @item.valid?
        expect(@item.errors.full_messages).to include('Information is too long (maximum is 1000 characters)')
      end

      it 'status_idが空だと登録できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it 'status_idが「--」だと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end

      it 'category_idが空だと登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idが「--」だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'shipping_cost_idが空だと登録できない' do
        @item.shipping_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it 'shipping_cost_idが「--」だと登録できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping cost must be other than 1')
      end

      it 'prefecture_idが空だと登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが「--」だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'days_to_ship_idが空だと登録できない' do
        @item.days_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end

      it 'days_to_ship_idが「--」だと登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship must be other than 1')
      end

      it 'priceが空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが299以下だと登録できない' do
        @item.price = Faker::Number.between(from: 0, to: 299)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが10000000以上だと登録できない' do
        @item.price = Faker::Number.number(digits: 8)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceが文字だと登録できない' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが整数でないと登録できない' do
        @item.price = 1000.5
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end

      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      #   it 'emailが空では登録できない' do
      #     @item.email = nil
      #     @item.valid?
      #     expect(@item.errors.full_messages).to include("Email can't be blank")
      #   end
      #   it 'emailには@がないと登録できない' do
      #     @item.email = 'aaaaa'
      #     @item.valid?
      #     expect(@item.errors.full_messages).to include('Email is invalid')
      #   end
      #   it '重複したemailが存在する場合登録できない' do
      #     @item.save
      #     another_item = FactoryBot.build(:item)
      #     another_item.email = @item.email
      #     another_item.valid?
      #     expect(another_item.errors.full_messages).to include('Email has already been taken')
      #   end
      #   it 'passwordが空では登録できない' do
      #     @item.password = nil
      #     @item.password_confirmation = nil
      #     @item.valid?
      #     expect(@item.errors.full_messages).to include("Password can't be blank")
      #   end
      #   it 'passwordが5文字以下であれば登録できない' do
      #     @item.password = 'abc12'
      #     @item.password_confirmation = 'abc12'
      #     @item.valid?
      #     expect(@item.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      #   end
      #   it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      #     @item.password_confirmation = nil
      #     @item.valid?
      #     expect(@item.errors.full_messages).to include("Password confirmation doesn't match Password")
      #   end
      #   it 'passwordが数字のみでは登録できない' do
      #     @item.password = '123456'
      #     @item.password_confirmation = '123456'
      #     @item.valid?
      #     expect(@item.errors.full_messages).to include('Password 英字と数字の両方を含めて設定してください')
      #   end
      #   it 'passwordが英字のみでは登録できない' do
      #     @item.password = 'abcdef'
      #     @item.password_confirmation = 'abcdef'
      #     @item.valid?
      #     expect(@item.errors.full_messages).to include('Password 英字と数字の両方を含めて設定してください')
      #   end
      #   it 'passwordが全角では登録できない' do
      #     @item.password = 'あいうえおか'
      #     @item.password_confirmation = 'あいうえおか'
      #     @item.valid?
      #     expect(@item.errors.full_messages).to include('Password 英字と数字の両方を含めて設定してください')
      #   end
      #   it 'first_nameが空では登録できない' do
      #     @item.first_name = nil
      #     @item.valid?
      #     expect(@item.errors.full_messages).to include("First name can't be blank")
      #   end
      #   it 'last_nameが空では登録できない' do
      #     @item.last_name = nil
      #     @item.valid?
      #     expect(@item.errors.full_messages).to include("Last name can't be blank")
      #   end
      #   it 'first_name_kanaが空では登録できない' do
      #     @item.first_name_kana = nil
      #     @item.valid?
      #     expect(@item.errors.full_messages).to include("First name kana can't be blank")
      #   end
      #   it 'last_name_kanaが空では登録できない' do
      #     @item.last_name_kana = nil
      #     @item.valid?
      #     expect(@item.errors.full_messages).to include("Last name kana can't be blank")
      #   end
      #   it 'first_nameが半角文字では登録できない' do
      #     @item.first_name = 'abc'
      #     @item.valid?
      #     expect(@item.errors.full_messages).to include('First name 全角文字を使用してください')
      #   end
      #   it 'last_nameが半角文字では登録できない' do
      #     @item.last_name = 'abc'
      #     @item.valid?
      #     expect(@item.errors.full_messages).to include('Last name 全角文字を使用してください')
      #   end
      #   it 'first_name_kanaが半角文字では登録できない' do
      #     @item.first_name_kana = 'abc'
      #     @item.valid?
      #     expect(@item.errors.full_messages).to include('First name kana 全角カタカナを使用してください')
      #   end
      #   it 'last_name_kanaが半角文字では登録できない' do
      #     @item.last_name_kana = 'abc'
      #     @item.valid?
      #     expect(@item.errors.full_messages).to include('Last name kana 全角カタカナを使用してください')
      #   end
      #   it 'birthdayが空では登録できない' do
      #     @item.birthday = nil
      #     @item.valid?
      #     expect(@item.errors.full_messages).to include("Birthday can't be blank")
      #   end
    end
  end
end
