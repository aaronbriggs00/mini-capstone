class Api::ProductsController < ApplicationController

  before_action :authenticate_admin, except: [:index, :show]
  
  def index
    @products = Product.all
    if params[:search]
      @products = @products.name_search(params[:search])
    end

    if params[:discount]
      @products = @products.where("price < ?", 10)
    end

    if params[:sort]
      if params[:sort_order]
        @products = @products.order("#{params[:sort]} #{params[:sort_order]}")
      else
        @products = @products.order("#{params[:sort]}")
      end
    else
      @products = @products.order(:id)
    end

    render "index.json.jb"
  end
  def show
    @product = Product.find(params[:id])
    render "show.json.jb"
  end 
  
  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      inventory: params[:inventory],
      supplier_id: params[:supplier_id]
    )
    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages}, status: 422
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    # @product.image_path = params[:image_path] || @product.image_path
    @product.description = params[:description] || @product.description
    @product.inventory = params[:inventory] || @product.inventory
    if @product.save
      render "show.json.jb"
    else
      render json: {errors: @product.errors.full_messages}, status: 422
    end
  end

  def destroy
    if current_user
      @product = Product.find(params[:id])
      @product.destroy
      render json: {message:"destroy operation successful"}
    else
      render json: {error: "you must be logged in to perform this action."}
    end
  end
end
