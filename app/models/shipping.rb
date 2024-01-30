class Shipping < ApplicationRecord
  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :address
    validates :building
    validates :phone_number
  end

  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :prefecture

  belongs_to :order

end
