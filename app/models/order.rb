class Order < ActiveRecord::Base
  attr_accessible :status

  belongs_to :user
end
