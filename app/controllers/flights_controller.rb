class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @dates = Flight.all.map { |f| f.start_datetime.to_date }.uniq

    if params[:search]
      @flights = Flight.where(
        departure_airport_id: params[:departure_airport_id],
        arrival_airport_id: params[:arrival_airport_id],
        start_datetime: DateTime.parse(params[:date]).all_day
      )
      @num_tickets = params[:passengers]
    else
      @flights = Flight.none
    end
  end
end
