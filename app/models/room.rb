class Room < ApplicationRecord

  belongs_to :user
  belongs_to :celeb
  has_many :messages
  has_one  :block
end
