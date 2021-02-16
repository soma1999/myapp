class Room < ApplicationRecord

  belongs_to :user
  belongs_to :celeb
  has_many :message_celebs
  has_many :message_users
end
