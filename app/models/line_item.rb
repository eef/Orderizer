class LineItem < ActiveRecord::Base
  attr_accessible :description, :price
  belongs_to :user
  belongs_to :order
end
