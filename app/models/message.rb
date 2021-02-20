class Message < ApplicationRecord

  with_options presence: true,length: {maximum: 100} do
    validates :content
  end

  belongs_to :celeb, optional: true
  belongs_to :room
  belongs_to :user, optional: true
end
