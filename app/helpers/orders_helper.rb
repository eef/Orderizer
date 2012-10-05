module OrdersHelper

  def order_status_label(status)
    statuses = {"open" => "success", "closed" => "important", "ordered" => "warning"}
    statuses[status]
  end

end
