class Api::ProductsController < ApplicationController
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
      # image_path: params[:image_path],
      description: params[:description],
      inventory: params[:inventory]
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
    @product = Product.find(params[:id])
    @product.destroy
    render json: {message:"destroy operation successful"}
  end
end
