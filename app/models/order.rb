class Order < ActiveRecord::Base
  
  has_many :line_items, dependent: :destroy

  PAYMENT_TYPES = ["Check", "Credit card", "Purchase order"] 
  
  validates :name, :address,  presence: true
  validates :email,
    format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: 'provide a valid email'},
    uniqueness: true

  validates :pay_type, inclusion: PAYMENT_TYPES 
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
