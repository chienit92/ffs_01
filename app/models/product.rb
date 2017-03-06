class Product < ApplicationRecord
  has_many :categories, through: :category_products
  has_many :category_products, dependent: :destroy
  has_many :combos, through: :combo_products
  has_many :combo_products, dependent: :destroy
  has_many :orders, through: :order_details
  has_many :order_details, dependent: :destroy

  mount_uploader :image, AvatarUploader

  validates :name, presence: true
  validates :price, presence: true
end
