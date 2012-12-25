class Item < ActiveRecord::Base
  belongs_to :menu
  attr_accessible :description, :price, :menu_id
end
