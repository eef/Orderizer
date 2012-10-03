class Order < ActiveRecord::Base
  attr_accessible :status

  belongs_to :user
  has_many :line_items

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

end
