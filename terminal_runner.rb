require "http"
system "clear"

input = gets.chomp


response = HTTP.delete("http://localhost:3000/api/products/#{input}")

p "Test"
