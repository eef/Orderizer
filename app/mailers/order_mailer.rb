class OrderMailer < ActionMailer::Base
  default :to => User.all.map(&:email),
          :from => "orders@orderizer.herokuapp.com"

  def order_open(order)
    mail(:subject => "A new roll order is open!")
  end
end
