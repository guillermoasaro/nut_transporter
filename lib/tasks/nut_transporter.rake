require_relative '../nut_calculator'

desc 'Read input from file and calculate max nuts amount that can be transported'
namespace :nuts do
  task :calculate, [:file_path] => :environment do |_task, args|
    file_path = args[:file_path]
    File.foreach(file_path, chomp: true) do |line|
      distance, nuts_amount, fuel_consumption, cart_capacity = NutCalculator.split_line(line)
      max_nuts = NutCalculator.calculate_max_nuts(distance, nuts_amount, fuel_consumption, cart_capacity)
      puts "#{distance},#{nuts_amount},#{fuel_consumption},#{cart_capacity},#{max_nuts}"
    end
  end
end
