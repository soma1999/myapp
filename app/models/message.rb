class Message < ApplicationRecord

  validates :content, presence: true,length: {maximum: 100} 

  belongs_to :celeb, optional: true
  belongs_to :room
  belongs_to :user, optional: true


end
