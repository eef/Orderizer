class LineItemsController < ApplicationController
    
  def create
    @order = Order.find(params[:order_id])
    @line_item = LineItem.new(params[:line_item])
    @line_item.user = current_user
    @order.line_items << @line_item
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Your roll has been added to the order cunt face.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

end
