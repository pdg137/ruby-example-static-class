class ShippingQuote
  def self.quote(items, destination_country)
    total_weight = self.get_total_weight(items)
    total_value = self.get_total_value(items)

    base_shipping = self.get_base_shipping(total_weight, destination_country)

    battery_charge = self.get_lithium_battery_charge(items)

    insurance = self.get_insurance(total_value)

    base_shipping + battery_charge + insurance
  end

  def self.get_total_weight(items)
    items.map { |x| x[:weight] }.inject(0, :+)
  end

  def self.get_total_value(items)
    items.map { |x| x[:price] }.inject(0, :+)
  end

  def self.get_base_shipping(total_weight, destination_country)
    case destination_country
    when 'us'
      # domestic shipping: $1.00 per 16 oz
      total_weight * 100 / 16
    else
      # international shipping: $2.00 per 16 oz
      total_weight * 200 / 16
    end
  end

  def self.get_lithium_battery_charge(items)
    if items.any? { |x| x[:name] == 'battery' }
      500
    else
      0
    end
  end

  def self.get_insurance(total_value)
    total_value * 50 / 10000
  end
end
