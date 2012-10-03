class LineItem < ActiveRecord::Base
  attr_accessible :description, :order_id, :price, :user_id
end
