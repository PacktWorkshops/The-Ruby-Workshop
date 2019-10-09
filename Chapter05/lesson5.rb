class User
  def initialize(name)
    @name = name
  end
end

class User
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def set_name(new_name)
    @name = new_name
  end
end


class User
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end
end


class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

end

class User
  attr_accessor :first_name, :last_name, :address

  def initialize(first_name, last_name, address)
    @first_name = first_name
    @last_name = last_name
    @address = address
  end

  def label
    "#{first_name} #{last_name}"
  end
end

class User
  attr_accessor :name, :address
  attr_reader :department

  def initialize(name, address, department)
    @name = name
    @address = address
    @department = department
    department.users << self
  end

  def department=(new_department)
    @department.users.delete(self)
    @department = new_department
    @department.users << self
  end
end

class Company
  attr_reader :name, :url
  attr_writer :departments

  def initialize(name, url)
    @name = name
    @url = URI.parse(url)
  end

  def departments
    @departments ||= []
  end

  def users
    departments.map(&:users).flatten
  end
end

class Department
  attr_accessor :name, :users, :company

  def initialize(name, company)
    @name = name
    @company = company
    company.departments << self
  end

  def users
    # override the accessor, 
    # to make sure we always have an array to work with to avoid nil conditions
    @users ||= []
  end
end


c = Company.new("Acme Inc", "https://example.com")
sales = Department.new("Sales", c)
engineering = Department.new("Engineering",c)
bob = User.new("Bob Smith", "1 Main Street", sales)
mary = User.new("Mary Jane", "10 Independence Blvd", engineering)
c.departments = [sales, engineering]
c.users

engineering.users.map(&:name)
bob.department  = engineering
engineering.users.map(&:name)
sales.users.map(&:name)

class Employee < User

  def employee_email
    # first.lastinitiation@example.com
    "#{@first_name}.#{@last_name[0]}@example.com"
  end

end

class Manager < Employee
  attr_reader :department

  def initialize(name, address, department)
    @department = department
    super(name, address)
  end

end

class Executive < Manager
end

class BoardMember < User
  def has_access_to_executive_bathroom?
    return true
  end
end


employee = Employee.new("Suzie McCall", "1 Broadway")
manager = Manager.new("Mary Gretchinson", "10 Main Street", )
board_member = BoardMember.new("Larry Tajinder", "55 Shattuck Rd")




Address.new(street: "1 Broadway", city: "New York")

class Condo;end
class Apartment;end
class House;end

class Structure
  @@types = ["house", "condo", "apartment"]
  attr_reader :type

  def self.types
    @@types
  end

  def self.factory(type)
    raise "Unhandled structure type: #{type}" unless @@types.include?(type.to_s)
    const_get(type.to_s.capitalize).new
  end

  def initialize(type)
    @type = type
  end

  
end

class Condo < Structure;end
class Apartment < Structure;end
class House < Structure;end


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
