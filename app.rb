# app.rb
require "sinatra"

# トップページ
get "/" do
  erb :index
end

# Aboutページ
get "/about" do
  erb :about
end

# Contactページ
get "/contact" do
  erb :contact
end