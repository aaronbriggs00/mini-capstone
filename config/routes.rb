Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end

  namespace :api do
    get "/products_all" => "products#products_all"
    get "product1" => "products#product1"
    get "product2" => "products#product2"
    get "product3" => "products#product3"
    get "product4" => "products#product4"
  end
end
