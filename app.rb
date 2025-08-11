# app.rb
require "sinatra"

# トップページ
get "/" do
  erb :index
end

# 一覧画面
get "/list" do
  erb :list
end

# 検索画面
get "/search" do
  erb :search
end