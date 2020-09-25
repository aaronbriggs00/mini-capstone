class Api::OrdersController < ApplicationController

  before_action :authenticate_user
  
  def index
    @orders = current_user.orders
    render "index.json.jb"
  end
  def show
    @order = Order.find(params[:id])
    if current_user.id == @order.user_id
      render "show.json.jb"
    else
      render json: {message: "you cannot view that!"}
    end
  end
  def create
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity]
    )
    @order.subtotal = @order.quantity * @order.product.price
    @order.tax = @order.subtotal * 0.09
    @order.total = @order.subtotal + @order.tax
    if @order.save
      render "show.json.jb"
    else
      render json: {message: "sad"}, status: 422
    end
  end
end
