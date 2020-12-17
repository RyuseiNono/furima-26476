class Item < ApplicationRecord
  # アソシエーションを定義
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  has_one :order, dependent: :destroy

  # アクティブハッシュのアソシエーションを定義
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :category
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :days_to_ship

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :image,presence: { message: 'を選択してください'}
    validates :name, length: { maximum: 40 }
    validates :information, length: { maximum: 1000 }

    # ジャンルの選択が「--」の時は保存できないようにする
    with_options numericality: { other_than: 1 } do
      validates :status_id,          numericality: { other_than: 1 , message: 'を選択してください'}
      validates :category_id,        numericality: { other_than: 1 , message: 'を選択してください'}
      validates :shipping_cost_id,   numericality: { other_than: 1 , message: 'を選択してください'}
      validates :prefecture_id,      numericality: { other_than: 1 , message: 'を選択してください'}
      validates :days_to_ship_id,    numericality: { other_than: 1 , message: 'を選択してください'}
    end

    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    # ¥300~¥9,999,999
  end
end
