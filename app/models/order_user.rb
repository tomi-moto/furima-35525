class OrderUser
  include ActiveModel::Model
  attr_accessor :post_num, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token, :purchase_record_id
    ## order_userのバリデーション
    with_options presence: true do
        validates :post_num, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
        validates :city
        validates :address
        validates :phone_number, format: { with: /\A\d{11}\z/}
       validates :token
    end
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  def save

    purchase_record = PurchaseRecord.create!(user_id: user_id, item_id: item_id)
    Order.create(post_num: post_num, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)

  end
end