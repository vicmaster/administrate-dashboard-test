class Order < ActiveRecord::Base
  has_many :products, through: :line_items
  has_many :line_items
  belongs_to :user  
end
