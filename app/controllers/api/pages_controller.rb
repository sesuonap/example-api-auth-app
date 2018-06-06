class Api::PagesController < ApplicationController
  def index
    response = Unirest.get("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=#{ ENV['PAGES_ID'] }")
    @info = response.body
    render 'index.json.jbuilder'
  end 
end
