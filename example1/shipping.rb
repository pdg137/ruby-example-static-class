class ShippingQuote
  def self.quote(items, destination_country)
    total_weight = items.map { |x| x[:weight] }.inject(0, :+)
    total_value = items.map { |x| x[:price] }.inject(0, :+)

    base_shipping = case destination_country
                    when 'us'
                      # domestic shipping: $1.00 per 16 oz
                      total_weight * 100 / 16
                    else
                      # international shipping: $2.00 per 16 oz
                      total_weight * 200 / 16
                    end

    # charge $5 extra for lithium batteries
    battery_charge = if items.any? { |x| x[:name] == 'battery' }
                       500
                     else
                       0
                     end

    # insurance costs $0.50 per $100
    insurance = total_value * 50 / 10000

    base_shipping + battery_charge + insurance
  end
end
