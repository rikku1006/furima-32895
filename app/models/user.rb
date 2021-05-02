class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :purchase_records
  has_many :messages

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :first_name,        format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'First name Full-width characters' }
    validates :last_name,         format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'Last name Full-width characters' }
    validates :kana_first_name,   format: { with: /\A[ァ-ヶー]+\z/, message: 'First name kana Full-width katakana characters' }
    validates :kana_last_name,    format: { with: /\A[ァ-ヶー]+\z/, message: 'Last name kana Full-width katakana characters' }
    validates :birthday
    validates :password,
              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Password Include both letters and numbers' }
  end
end
