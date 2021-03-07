class Room < ApplicationRecord

  belongs_to :user
  belongs_to :celeb
  has_many :messages, dependent: :destroy
  has_one  :block, dependent: :destroy
  has_one  :like, dependent: :destroy
  has_many :orders
end
