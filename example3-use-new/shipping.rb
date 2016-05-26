class ShippingQuote
  def initialize(items, destination_country)
    @items = items
    @destination_country = destination_country
  end

  def call
    base_shipping + battery_charge + insurance
  end

  def total_weight
    @total_weight ||= @items.map { |x| x[:weight] }.inject(0, :+)
  end

  def total_value
    @total_value ||= @items.map { |x| x[:price] }.inject(0, :+)
  end

  def base_shipping
    case @destination_country
    when 'us'
      # domestic shipping: $1.00 per 16 oz
      total_weight * 100 / 16
    else
      # international shipping: $2.00 per 16 oz
      total_weight * 200 / 16
    end
  end

  def lithium_battery_charge
    if @items.any? { |x| x[:name] == 'battery' }
      500
    else
      0
    end
  end

  def insurance
    total_value * 50 / 10000
  end
end
