class Shop < ApplicationRecord
  has_many :staffs, dependent: :destroy
  has_many :orders

  belongs_to :location
end
