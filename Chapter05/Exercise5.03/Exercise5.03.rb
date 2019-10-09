class Address
  attr_accessor :street_address, :city, :post_code
  def initialize(street_address, city, post_code)
    @street_address = street_address
    @city = city
    @post_code = post_code
  end
end

class Address
  attr_reader :street_address, :city, :post_code
  def initialize(street_address, city, post_code)
    @street_address = street_address
    @city = city
    @post_code = post_code
  end
end

a = Address.new("25 Martin Luther King Jr Blvd", "Oakland", "94008")
a.street_address
a.post_code
a.street_address = "5 Broadway"
a.street_address


class Address
  attr_reader :street_address, :city, :post_code, :country
  def initialize(street_address, city, post_code, country)
    @street_address = street_address
    @city = city
    @post_code = post_code
  end  
end

class UnitedStatesAddress < Address
  attr_reader :state

  def initialize(street_address, city, state, post_code)
    @state = state
    @country = "UnitedStates"
    super
  end
end

class CanadianAddress < Address
  attr_reader :province

  def initialize(opts = {})
    @country = "Canada"

    street_address = opts[:street_address]
    city = opts[:city]
    province = opts[:province]
    post_code = opts[:post_code]
    super(street_address, city, post_code, country)
  end
end