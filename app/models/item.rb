class Item < ApplicationRecord
  has_one_attached :image

  # アクティブハッシュのアソシエーションを定義
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :category
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :days_to_ship

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :image
    validates :name
    validates :information

    #ジャンルの選択が「--」の時は保存できないようにする
    with_options  numericality: { other_than: 1 } do
      validates :status_id
      validates :category_id
      validates :shipping_cost_id
      validates :prefecture_id
      validates :days_to_ship_id
    end

    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    # ¥300~¥9,999,999
  end


end
