class Order < ApplicationRecord

  belongs_to :price
  belongs_to :room
end
