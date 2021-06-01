class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birth_date
    with_options format: {with: /\A[ぁ-んァ-ン一-龥]/} do
      validates :first_name
      validates :last_name
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/} do
      validates :first_kana
      validates :last_kana
    end
  end

  validates :password, length: { minimum:6 }, format:{with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
end

