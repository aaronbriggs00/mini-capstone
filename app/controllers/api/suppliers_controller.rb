class Api::SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render "index.json.jb"
  end
  def show
    @supplier = Supplier.find(params[:id])
    render "show.json.jb"
  end
  def create
    
  end
  def update
    
  end
  def destroy
    
  end
end
