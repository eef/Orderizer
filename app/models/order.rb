class Order < ActiveRecord::Base
  attr_accessible :status, :line_items_attributes

  belongs_to :creator, :class_name => "User", :foreign_key => :user_id
  has_many :users, :through => :line_items
  has_many :line_items, :dependent => :destroy
  has_many :items, :through => :line_items
  accepts_nested_attributes_for :line_items, :allow_destroy => true

  # class methods
  # class methods are methods available when called from the class like so
  # Order.open will return all open orders.
  class << self
    def open
      where(:status => "open")
    end
    def closed
      where(:status => "closed")
    end
    def ordered
      where(:status => "ordered")
    end
  end

  # instances methods
  # an instance method is methods available only when called on an instance
  # of an object e.g @order = Order.first All of the following methods will 
  # be availble like so @order.closed?
  def closed?
    self.status.eql?("closed")
  end

  def open?
    self.status.eql?("open")
  end

  def ordered?
    self.status.eql?("ordered")
  end

  def total_price
    price = 0
    self.line_items.each {|item| price = price + item.price.to_s.to_d }
    price
  end

  def owner?(user)
    self.creator.eql?(user)
  end

end
