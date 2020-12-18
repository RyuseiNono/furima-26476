class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :items, dependent: :destroy
  has_many :orders
  has_many :messages

  with_options presence: true do
    validates :nickname

    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'は全角文字を使用してください' } do
      validates :first_name
      validates :last_name
    end

    with_options format: { with: /\A[ァ-ン|ー]+\z/, message: 'は全角カタカナを使用してください' } do
      validates :first_name_kana
      validates :last_name_kana
    end

    with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は英字と数字の両方を含めて設定してください' } do
      validates :password
    end

    validates :birthday
  end
end
