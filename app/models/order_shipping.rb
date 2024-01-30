class OrderShipping
  include ActiveModel::Model
  #include ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :user_id, :item_id, :order_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    #validates :order_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "should be in the format xxx-xxxx" }
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "should be 10 to 11 digits" }
  end

  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}

  #extend ActiveHash::Associations::ActiveRecordExtensions

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create(
      order_id: order&.id,
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      building: building,
      phone_number: phone_number
    )
  end
end