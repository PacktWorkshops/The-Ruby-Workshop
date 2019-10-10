module Address
  attr_accessor :address_line1, :address_line2, :city, :state, :postal_code, :country 

  def region
    return nil if country.nil? || country == ""
    case country
    when "United States", "Canada", "Mexico"
        "North America"
    else
        "Global"
    end
  end
end

class User
  include Address
end

class Department
  include Address
end

class Employee < User
  attr_accessor :department
  def region
    if department
        department.region || super
    else
        super
    end
  end
end

