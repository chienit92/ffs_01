class Order < ApplicationRecord
  has_many :prorder_detailucts, through: :order_details
  has_many :order_details, dependent: :destroy

  belongs_to :discount, optional: true
  belongs_to :shop, optional: true
  belongs_to :user, optional: true

  enum status: [:waiting, :accepted, :rejected, :finished]
  scope :unassign, -> {where shop_id: nil}

  before_create :init_order
  before_save :update_subtotal

  def subtotal
    order_details.collect {|order_detail| order_detail.valid? ?
      order_detail.total : Settings.min_total}.sum
  end

  private
  def init_order
    self[:total] = Settings.min_total
  end

  def update_subtotal
    self[:total] = subtotal
  end
end
