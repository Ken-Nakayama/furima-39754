class Shipping < ApplicationRecord
  belongs_to :prefecture, class_name: 'Prefecture'
  belongs_to :order
end
