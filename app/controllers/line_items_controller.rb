class LineItemsController < ApplicationController
    
  def create
    @order = Order.find(params[:order_id])
    @line_item = LineItem.new(params[:line_item])
    @line_item.user = current_user
    @order.line_items << @line_item
    respond_to do |format|
      if @order.save
        OrderMailer.added_line_item(@line_item).deliver
        format.html { redirect_to @order, notice: 'Your roll has been added to the order cunt face.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @line_item = current_user.line_items.find(params[:id])
    @order = @line_item.order
  end

  def update
    @order = Order.find(params[:order_id])
    @line_item = current_user.line_items.find(params[:id])
    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to @order, notice: 'You roll was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end


end
