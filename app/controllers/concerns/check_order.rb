module CheckOrder
  def check_product_and_current_order
    @order = Order.find_by id: session[:order_id]
    unless @order
      @order = Order.create
      session[:order_id] = @order.id
    end
    if params[:order_detail]
      @product = Product.find_by id: params[:order_detail][:product_id]
      unless @product
        redirect_to root_path
      end
    end
  end

  def check_staff_order
    if staff_signed_in?
      flash[:danger] = t "flash.danger.staff"
      redirect_to root_path
    else
      @order_detail = current_order.order_details.new
    end
  end
end
