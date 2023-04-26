module NutCalculator
  def self.calculate_max_nuts(distance, nuts_amount, fuel_consumption, cart_capacity)
    # Calculate the fuel cost of a single trip
    single_trip_cost = distance * fuel_consumption.to_f

    return 0 if cart_capacity.zero? ||
                nuts_amount.zero? ||
                cart_capacity <= single_trip_cost ||
                nuts_amount <= single_trip_cost

    return nuts_amount if single_trip_cost.zero?

    # calculate the number of trips required
    num_trips = (nuts_amount / cart_capacity.to_f).ceil

    # Calculate the amount of nuts that can be transported to the town,
    # in all trips but the last the cost is double to make a round trip.
    # Note that if num_trips = 1, max_nuts will be initialized to zero
    round_trip_nuts = (num_trips - 1) * (cart_capacity - 2 * single_trip_cost)
    max_nuts = [round_trip_nuts, 0].max

    # Add the amount transported in the last trip
    max_nuts +=
      if num_trips == 1 || round_trip_nuts.negative?
        [nuts_amount, cart_capacity].min - single_trip_cost
      else
        remainder = (nuts_amount % cart_capacity)
        nuts_left = remainder.zero? ? cart_capacity : remainder
        [nuts_left - single_trip_cost, single_trip_cost].max
      end

    # Make sure the result is not negative
    [max_nuts, 0].max.round(0)
  end

  def self.split_line(line)
    line.split(',').map(&:to_i)
  end
end
