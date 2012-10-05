class OrderMailer < ActionMailer::Base
  default :from => "orders@orderizer.herokuapp.com"

  def order_open(order)
    @order = order
    mail(:subject => "A new roll order is open!", :to => User.all.map(&:email))
  end

  def order_closed(order)
    @order = order
    mail(:subject => "The rolls are here!", :to => @order.users.map(&:email))
  end
  
  def added_line_item(item)
    @item = item
    mail(:subject => "Your roll has been added to the order!", :to => @item.user.email)
  end
end
