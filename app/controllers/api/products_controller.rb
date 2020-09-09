class Api::ProductsController < ApplicationController
  def products_all
    @products = Product.all
    render "products_all.json.jb"
  end
end
