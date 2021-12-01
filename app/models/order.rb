class Order < ApplicationRecord
  belongs_to :user

  has_many :product_lists #存储购买明细

  has_many :comments

  validates :billing_name, presence: true
  validates :phone_number, presence: true

  #乱序订单号

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end

  #付款
  def set_payment_with!(method)
    self.update_columns(payment_method: method )
  end

  def pay!
    self.update_columns(is_paid: true )
  end

  #订单状态

  include AASM

  aasm do
    state :order_placed, initial: true #下单
    state :paid #已付款
    state :activated #已激活

    state :order_cancelled  #申请取消
    state :good_returned    #退货


    event :make_payment, after_commit: :pay! do
      transitions from: :order_placed, to: :paid
    end

    event :activate do
      transitions from: :paid,     to: :activated
    end

    event :return_good do
      transitions from: :activated,      to: :good_returned
    end

    event :cancel_order do
      transitions from: [:order_placed, :paid], to: :order_cancelled
    end
  end
end
