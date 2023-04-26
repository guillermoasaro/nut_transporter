require 'nut_calculator'

RSpec.describe NutCalculator do
  describe '.calculate_max_nuts' do
    context 'when all input values are greater than 0' do
      let(:distance) { 100 }
      let(:nuts_amount) { 3000 }
      let(:fuel_consumption) { 1 }
      let(:cart_capacity) { 1000 }

      it 'returns a non-negative number' do
        result = NutCalculator.calculate_max_nuts(distance, nuts_amount, fuel_consumption, cart_capacity)
        expect(result).to be >= 0
      end
    end

    context 'when nuts amount and cart capacity are equal' do
      let(:nuts_amount) { 1000 }
      let(:cart_capacity) { 1000 }

      context 'when trip_cost is 100' do
        let(:distance) { 100 }
        let(:fuel_consumption) { 1 }

        it 'returns nuts_amount - trip_cost' do
          result = NutCalculator.calculate_max_nuts(distance, nuts_amount, fuel_consumption, cart_capacity)
          expect(result).to eq(900)
        end
      end

      context 'when trip_cost is 200' do
        let(:distance) { 200 }
        let(:fuel_consumption) { 1 }

        it 'returns nuts_amount - trip_cost' do
          result = NutCalculator.calculate_max_nuts(distance, nuts_amount, fuel_consumption, cart_capacity)
          expect(result).to eq(800)
        end
      end
    end

    context 'when it makes a single trip' do
      context 'when the nuts_amount <= cart_capacity' do
        let(:distance) { 100 }
        let(:nuts_amount) { 300 }
        let(:fuel_consumption) { 1 }
        let(:cart_capacity) { 500 }

        it 'returns nuts_amount - trip_cost' do
          result = NutCalculator.calculate_max_nuts(distance, nuts_amount, fuel_consumption, cart_capacity)
          trip_cost = fuel_consumption * distance
          expect(result).to eq(nuts_amount - trip_cost)
        end
      end

      context 'when the cart_capacity <= round_trip_cost' do
        let(:distance) { 100 }
        let(:nuts_amount) { 1000 }
        let(:fuel_consumption) { 1 }
        let(:cart_capacity) { 199 }

        it 'returns cart_capacity - trip_cost' do
          result = NutCalculator.calculate_max_nuts(distance, nuts_amount, fuel_consumption, cart_capacity)
          trip_cost = fuel_consumption * distance
          expect(result).to eq(cart_capacity - trip_cost)
        end
      end

      context 'when the round trip is not worth it' do
        let(:distance) { 100 }
        let(:nuts_amount) { 350 }
        let(:fuel_consumption) { 1 }
        let(:cart_capacity) { 250 }

        it 'returns cart_capacity - trip_cost' do
          result = NutCalculator.calculate_max_nuts(distance, nuts_amount, fuel_consumption, cart_capacity)
          trip_cost = fuel_consumption * distance
          expect(result).to eq(cart_capacity - trip_cost)
        end
      end
    end

    context 'when it makes multiple trips' do
      context 'when it can transport all the nuts' do
        let(:distance) { 100 }
        let(:nuts_amount) { 900 }
        let(:fuel_consumption) { 1 }
        let(:cart_capacity) { 300 }

        it 'returns 400' do
          result = NutCalculator.calculate_max_nuts(distance, nuts_amount, fuel_consumption, cart_capacity)
          expect(result).to eq(400)
        end
      end

      context 'when it leaves some nuts behind' do
        let(:distance) { 100 }
        let(:nuts_amount) { 1000 }
        let(:fuel_consumption) { 1 }
        let(:cart_capacity) { 300 }

        it 'returns 400' do
          result = NutCalculator.calculate_max_nuts(distance, nuts_amount, fuel_consumption, cart_capacity)
          expect(result).to eq(400)
        end
      end
    end

    context 'when a single trip can not be afforded' do
      context 'when cart_capacity is zero' do
        let(:distance) { 100 }
        let(:nuts_amount) { 3000 }
        let(:fuel_consumption) { 1 }
        let(:cart_capacity) { 0 }

        it 'returns 0' do
          result = NutCalculator.calculate_max_nuts(distance, nuts_amount, fuel_consumption, cart_capacity)
          expect(result).to eq(0)
        end
      end

      context 'when cart_capacity is not enough' do
        let(:distance) { 100 }
        let(:nuts_amount) { 3000 }
        let(:fuel_consumption) { 1 }
        let(:cart_capacity) { 10 }

        it 'returns 0' do
          result = NutCalculator.calculate_max_nuts(distance, nuts_amount, fuel_consumption, cart_capacity)
          expect(result).to eq(0)
        end
      end

      context 'when nuts_amount is zero' do
        let(:distance) { 100 }
        let(:nuts_amount) { 0 }
        let(:fuel_consumption) { 1 }
        let(:cart_capacity) { 1000 }

        it 'returns 0' do
          result = NutCalculator.calculate_max_nuts(distance, nuts_amount, fuel_consumption, cart_capacity)
          expect(result).to eq(0)
        end
      end

      context 'when nuts_amount is not enough' do
        let(:distance) { 100 }
        let(:nuts_amount) { 99 }
        let(:fuel_consumption) { 1 }
        let(:cart_capacity) { 1000 }

        it 'returns 0' do
          result = NutCalculator.calculate_max_nuts(distance, nuts_amount, fuel_consumption, cart_capacity)
          expect(result).to eq(0)
        end
      end
    end

    context 'when there is no effort required to transport' do
      context 'when distance is 0' do
        let(:distance) { 0 }
        let(:nuts_amount) { 10 }
        let(:fuel_consumption) { 1 }
        let(:cart_capacity) { 1000 }

        it 'returns nuts_amount' do
          result = NutCalculator.calculate_max_nuts(distance, nuts_amount, fuel_consumption, cart_capacity)
          expect(result).to eq(10)
        end
      end

      context 'when fuel_consumption is 0' do
        let(:distance) { 100 }
        let(:nuts_amount) { 2000 }
        let(:fuel_consumption) { 0 }
        let(:cart_capacity) { 1 }

        it 'returns nuts_amount' do
          result = NutCalculator.calculate_max_nuts(distance, nuts_amount, fuel_consumption, cart_capacity)
          expect(result).to eq(2000)
        end
      end

      context 'but cart_capacity is 0' do
        let(:distance) { 0 }
        let(:nuts_amount) { 3000 }
        let(:fuel_consumption) { 1 }
        let(:cart_capacity) { 0 }

        it 'returns 0' do
          result = NutCalculator.calculate_max_nuts(distance, nuts_amount, fuel_consumption, cart_capacity)
          expect(result).to eq(0)
        end
      end

      context 'but nuts_amount is 0' do
        let(:distance) { 100 }
        let(:nuts_amount) { 0 }
        let(:fuel_consumption) { 0 }
        let(:cart_capacity) { 1000 }

        it 'returns 0' do
          result = NutCalculator.calculate_max_nuts(distance, nuts_amount, fuel_consumption, cart_capacity)
          expect(result).to eq(0)
        end
      end
    end
  end
end
