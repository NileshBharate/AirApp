class HomeController < ApplicationController
  def index

    require "net/http"

    @url="https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=20002&distance=25&API_KEY=18EE4DC4-8F5E-4E70-87DB-B13E927005EF"
    @uri=URI(@url)
    @response=Net::HTTP.get(@uri)
    @output=JSON.parse(@response)

    if @output.empty?
      @final_output="Please Enter a valid Zip Code"
      @api_color="blue"
    else
      @final_output=@output[0]['AQI']
      if@final_output>1 && @final_output<=50
        @api_color="green"
      elsif @final_output>50 && @final_output<=100
        @api_color="yellow" 
      elsif @final_output>100 && @final_output<=150
        @api_color="orange" 
      elsif @final_output>150 && @final_output<=200
        @api_color="red"
      elsif @final_output>200 && @final_output<=251
        @api_color="purple"
      else
        @api_color="pink"
      end

    end
  end
end
