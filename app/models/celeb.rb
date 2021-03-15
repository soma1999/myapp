class Celeb < ApplicationRecord
  has_secure_password
  has_one_attached :image

  with_options presence: true do
    validates :email
    validates :name
    validates :password
    validates :image
    validates :description
  end

  with_options uniqueness: true do
    validates :email
    validates :name
  end

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}, length: {minimum: 6}

  validates :description, length: {maximum: 120}


  has_many :users, through: :rooms
  has_many :rooms , dependent: :destroy
  has_many :messages, dependent: :destroy
  
end
