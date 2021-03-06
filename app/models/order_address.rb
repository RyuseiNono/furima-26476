class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :street_address, :building, :phone_number, :item_id, :user_id

  validates :token, presence: { message: 'クレジットカード情報が正しくありません' }
  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :postal_code,     format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'が間違えています. ハイフンを入れてください' }
    validates :prefecture_id,   numericality: { other_than: 1, message: 'を選択してください' }
    validates :city
    validates :street_address
    # validates :building #空でも可
    validates :phone_number, numericality: {}, length: { maximum: 11 }
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_address: street_address,\
                   building: building, phone_number: phone_number, order_id: order.id)
  end
end
