class Celeb < ApplicationRecord
  has_secure_password
  has_one_attached :image

  with_options presence: true, uniqueness: true do
    validates :email
    validates :name
  end

  validates  :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}, length: {minimum: 6 }

  validates :description, presence: true, length: {maximum: 120}


  has_many :users, through: :rooms
  has_many :rooms 
  has_many :messages

end
