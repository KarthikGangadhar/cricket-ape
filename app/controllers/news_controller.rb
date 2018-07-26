require './lib/cricket_api/request.rb'
require 'news/news.rb'

class NewsController < ApplicationController
  def show      
      cricApires = CricApi::Request.new('https://apecricket.herokuapp.com', 0)
      binding.pry
      @news = News.new(cricApires.getNews)
      # @news = cricApires.jsonRead('./lib/cricket_api/json_data/news.json')
  end
end
