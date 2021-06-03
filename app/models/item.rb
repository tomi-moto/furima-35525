class Item < ApplicationRecord
  belongs_to :user
  #has_one :purchase_record
  has_one_attached :image

  def was_attached?
    self.image.was_attached?
  end

  with_options presence: true do
    validates :image
    validates :title
    validates :price, inclusion: {in: 300..9999999 }
    validates :introduction
    validates :category_id, numericality: { other_than: 0 }
    validates :state_id, numericality: { other_than: 0 }
    validates :fee_id, numericality: { other_than: 0 }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :days_id, numericality: { other_than: 0 }
  end

# ActiveHash
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :days
end
