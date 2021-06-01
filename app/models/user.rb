class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password_confirmation
    validates :birth_date
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_kana, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :last_kana, format: {with: /\A[ァ-ヶー－]+\z/}
  end

  validates :password, length: { minimum:6 }, format:{with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
end

