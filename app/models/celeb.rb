class Celeb < ApplicationRecord
  has_secure_password

  with_options presence: true, uniqueness: true do
    validates :email
    validates :name
  end

  validates  :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}, length: {minimum: 6 }

  validates :description, presence: true


  has_many :users, through: :rooms
  has_many :rooms 
  has_many :message_celebs
end
