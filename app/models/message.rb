class Message < ApplicationRecord
  belongs_to :item
  belongs_to :user

  with_options presence: true do
    validates :text
    validates :item_id
    validates :user_id
  end
end
