require './lib/cricket_api/request.rb'
require 'cricapi_response.rb'

class CricketController < ApplicationController
  def show 
      cricApires = CricApi::Request.new('https://apecricket.herokuapp.com', 0)     
      request = CricApi::ProfessionalProfile.new().getResponseforHome
      # @news = {
      #   :news => request[:news],
      #   :count => request[:news]['data']['data'].count
      # }
      # @matchCalendar = request[:matchcalendar]
      # @cricket = request[:cricket]
      # @matches = request[:matches]
      # @liveUpdate = CricApi::ProfessionalProfile.new().getAllScore(@cricket)
      @news = {
        :news => cricApires.jsonRead('./lib/cricket_api/json_data/news.json'),
        :count => 20
      }
      @matchCalendar = cricApires.jsonRead('./lib/cricket_api/json_data/schedule.json')
      @cricket = cricApires.jsonRead('./lib/cricket_api/json_data/cricket.json')
      @matches = cricApires.jsonRead('./lib/cricket_api/json_data/matches.json')
      @liveUpdate = CricApi::ProfessionalProfile.new().getAllScore(@cricket)
  end
end
