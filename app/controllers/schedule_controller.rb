require './lib/cricket_api/request.rb'

class ScheduleController < ApplicationController
  def show
    cricApires = CricApi::Request.new('https://apecricket.herokuapp.com', 0)
    # @matchCalendar = cricApires.matchCalendar
      @matchCalendar = cricApires.jsonRead('./lib/cricket_api/json_data/schedule.json')

  end
end

