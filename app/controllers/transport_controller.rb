class TransportController < ApplicationController
  def index
    @results = JSON.parse params[:results] if params[:results]
  end

  def calculate_max_nuts
    return unless params[:input].present?

    @results = []
    input_lines = params[:input].split("\n")

    input_lines.each do |line|
      distance, nuts_amount, fuel_consumption, cart_capacity = NutCalculator.split_line(line)

      max_nuts = NutCalculator.calculate_max_nuts(distance, nuts_amount, fuel_consumption, cart_capacity)

      @results << [distance, nuts_amount, fuel_consumption, cart_capacity, max_nuts]
    end

    redirect_to transport_index_path(results: @results.to_json)
  end
end
