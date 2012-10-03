class User < ActiveRecord::Base
  easy_roles :roles

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name

  has_many :orders
  has_many :line_items

  def name
    [self.first_name, self.last_name].join(" ")
  end

end
