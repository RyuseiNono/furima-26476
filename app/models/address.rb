class Address < ApplicationRecord
  belongs_to :order

  # アクティブハッシュのアソシエーションを定義
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
