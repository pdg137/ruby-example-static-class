require_relative 'shipping.rb'

items = [{name: 'robot', price: 10000, weight: 320}]

puts "Shipping a robot, domestic: #{ShippingQuote.quote(items, 'us')}"
puts "Shipping a robot to Canada: #{ShippingQuote.quote(items, 'ca')}"

items = [{name: 'battery', price: 500, weight: 8},
         {name: 'robot', price: 10000, weight: 320}]

puts "Shipping a robot + batteries, domestic: #{ShippingQuote.quote(items, 'us')}"
puts "Shipping a robot + batteries to Canada: #{ShippingQuote.quote(items, 'ca')}"
