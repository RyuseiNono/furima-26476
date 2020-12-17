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
        expect(@item.errors.full_messages).to include('商品名を入力してください')
        # expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'nameが40文字以上だと登録できない' do
        @item.name = Faker::Lorem.paragraph_by_chars(number: 50)
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名は40文字以内で入力してください')
        # expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end

      it 'informationが空だと登録できない' do
        @item.information = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
        # expect(@item.errors.full_messages).to include("Information can't be blank")
      end

      it 'informationが1000文字以上だと登録できない' do
        @item.information = Faker::Lorem.paragraph_by_chars(number: 1010)
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明は1000文字以内で入力してください')
        # expect(@item.errors.full_messages).to include('Information is too long (maximum is 1000 characters)')
      end

      it 'status_idが空だと登録できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を入力してください')
        # expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it 'status_idが「--」だと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
        # expect(@item.errors.full_messages).to include('Status must be other than 1')
      end

      it 'category_idが空だと登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを入力してください')
        # expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idが「--」だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
        # expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'shipping_cost_idが空だと登録できない' do
        @item.shipping_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を入力してください')
        # expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it 'shipping_cost_idが「--」だと登録できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
        # expect(@item.errors.full_messages).to include('Shipping cost must be other than 1')
      end

      it 'prefecture_idが空だと登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('都道府県を入力してください')
        # expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが「--」だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('都道府県を選択してください')
        # expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'days_to_ship_idが空だと登録できない' do
        @item.days_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を入力してください')
        # expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end

      it 'days_to_ship_idが「--」だと登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
        # expect(@item.errors.full_messages).to include('Days to ship must be other than 1')
      end

      it 'priceが空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を入力してください')
        # expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが299以下だと登録できない' do
        @item.price = Faker::Number.between(from: 0, to: 299)
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
        # expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが10000000以上だと登録できない' do
        @item.price = Faker::Number.number(digits: 8)
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
        # expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceが文字だと登録できない' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
        # expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが整数でないと登録できない' do
        @item.price = 1000.5
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は整数で入力してください')
        # expect(@item.errors.full_messages).to include('Price must be an integer')
      end

      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('出品画像を選択してください')
        # expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザーを入力してください')
        # expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
