class Price < ApplicationRecord

  has_many :orders, dependent: :destroy
end
