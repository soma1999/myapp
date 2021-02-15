class Celeb < ApplicationRecord

  with_options presence: true, uniqueness: true do
    validates :email
    validates :name
  end

  validates  :password_digest, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}, length: {minimum: 6 }

  validates :description, presence: true

end
