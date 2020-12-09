class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  # has_one :adress #Adressモデル未実装のため
end
