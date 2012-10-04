class OrderMailer < ActionMailer::Base
  default :to => User.all.map(&:email),
          :from => "orders@orderizer.herokuapp.com"

  def order_open(order)
    @order = order
    mail(:subject => "A new roll order is open!")
  end
  
  def added_line_item(item)
    @item = item
    mail(:subject => "Your roll has been added to the order!")
  end
end
