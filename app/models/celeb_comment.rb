class CelebComment < ApplicationRecord
  validates :content, length: {maximum: 140}

  belongs_to :celeb
  belongs_to :room
end
