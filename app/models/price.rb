class Price < ApplicationRecord

  has_many :orders, dependent: :destroy

  validates :content, uniqueness: true

end
