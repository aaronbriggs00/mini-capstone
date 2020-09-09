class Api::ProductsController < ApplicationController
  def products_all
    @products = Product.all
    render "products_all.json.jb"
  end
  def product1
    @product = Product.find_by(id: 1)
    render "product.json.jb"
  end
  def product2
    @product = Product.find_by(id: 2)
    render "product.json.jb"
  end
  def product3
    @product = Product.find_by(id: 3)
    render "product.json.jb"
  end
  def product4
    @product = Product.find_by(id: 4)
    render "product.json.jb"
  end
end
