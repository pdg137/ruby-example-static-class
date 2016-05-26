require_relative 'shipping.rb'

items = [{name: 'robot', price: 10000, weight: 320}]

quote = ShippingQuote.new(items, 'us')
puts "Shipping a robot, domestic: #{quote.call}"

quote = ShippingQuote.new(items, 'ca')
puts "Shipping a robot to Canada: #{quote.call}"

items = [{name: 'battery', price: 500, weight: 8},
         {name: 'robot', price: 10000, weight: 320}]

quote = ShippingQuote.new(items, 'us')
puts "Shipping a robot + batteries, domestic: #{quote.call}"

quote = ShippingQuote.new(items, 'ca')
puts "Shipping a robot + batteries to Canada: #{quote.call}"
