class Celeb < ApplicationRecord

  with_options presence: true, uniqueness: true do
    validates :email
    validates :name
  end

  vallidates  
    :password,
    format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i},
    length: {minmum: 6 }

  validates :description, presence: true

end
