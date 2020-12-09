class Adress < ApplicationRecord
  belongs_to :order

  # アクティブハッシュのアソシエーションを定義
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :postal_code,     format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id,   numericality: { other_than: 1 }
    validates :city
    validates :street_address
    #validates :building #空でも可
    validates :phone_number,    numericality:{}
  end
end
