class LineItem < ActiveRecord::Base
  attr_accessible :description, :price, :item_id
  belongs_to :user
  belongs_to :order
  belongs_to :item

  def owner?(user)
    self.user.eql?(user)
  end

end
