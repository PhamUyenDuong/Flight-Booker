class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @flights = Flight.all

    if params[:departure_airport_id].present? && params[:arrival_airport_id].present? && params[:start_date].present?
      @flights = Flight.where(
        departure_airport_id: params[:departure_airport_id],
        arrival_airport_id: params[:arrival_airport_id],
        start_datetime: DateTime.parse(params[:start_date]).all_day
      )
    end
  end
end
