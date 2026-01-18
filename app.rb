# app.rb
require "sinatra"
require "net/http"
require "json"

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
  api_key = "YOUR_API_KEY"  # ここにAPIキーを入れてください
  keyword = params["keyword"] || "渋谷"

  uri = URI("https://webservice.recruit.co.jp/hotpepper/gourmet/v1/")
  uri.query = URI.encode_www_form({
    key: api_key,
    format: "json",
    keyword: keyword
  })

  res = Net::HTTP.get_response(uri)

  if res.is_a?(Net::HTTPSuccess)
    @results = JSON.parse(res.body)
  else
    @results = nil
  end
  erb :search
end