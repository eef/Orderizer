class Order < ActiveRecord::Base
  attr_accessible :status

  belongs_to :user

  class << self
    def open
      where(:status => "open")
    end
    def closed
      where(:status => "closed")
    end
  end
end
