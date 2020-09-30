class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user
  def index
    @carted_products = current_user.carted_products.where("status = ?", "carted")
    render "index.json.jb"
  end
  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity]
    )
    if @carted_product.save
      render json: { message: "item successfully added to cart"}
    end
  end
  def destroy
    carted_product = CartedProduct.find(params[:id])
    @carted_products = User.find(current_user.id).carted_products.where("status = ?", "carted")
    if current_user.id == carted_product.user_id
      carted_product.status = "removed"
      carted_product.save
      render "index.json.jb"
    end
  end
end
