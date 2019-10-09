class User 
end 

class Company 
end 

class Department 
end 

class User 

  attr_accessor :name, :address, :department 
  def initialize(name, address, department) 

    @name = name 

    @address = address 

    @department = department 

  end 

end 

class Company 

  attr_accessor :name, :url, :departments 

  def initialize(name, url) 

    @name = name 

    @url = URI.parse(url) 

  end 

end 

class Department 

  attr_accessor :name, :users 

  def initialize(name) 

    @name = name 

  end 

end 
c = Company.new("Acme Inc", "https://example.com") 
sales = Department.new("Sales") 

engineering = Department.new("Engineering") 
bob = User.new("Bob Smith", "1 Main Street", sales) 

mary = User.new("Mary Jane", "10 Independence Blvd", engineering) 
c.departments = [sales, engineering] 
class Company 

  attr_accessor :name, :url, :departments 

  def initialize(name, url) 

    @name = name 

    @url = URI.parse(url) 

  end 

  def users 

    departments.map(&:users) 

  end 

end 

#code for seeding the users instance variable at object creation
class Department 

  attr_accessor :name, :users 
  def initialize(name) 

    @name = name 

    @users = [] 

  end 

end 

#code for seeding the users instance variable at runtime
class Department 

  attr_accessor :name, :users 

  def initialize(name) 

    @name = name 

  end 

  def users 

    # override the accessor,  

    # to make sure we always have an array to work with to avoid nil conditions 

    @users ||= []  

  end 

end 
class User 

  attr_accessor :name, :address, :department 

  def initialize(name, address, department) 

    @name = name 

    @address = address 

    @department = department 

    @department.users << self 

  end 

end 
# setup data 

c = Company.new("Acme Inc", "https://example.com") 

sales = Department.new("Sales") 

engineering = Department.new("Engineering") 

bob = User.new("Bob Smith", "1 Main Street", sales) 

mary = User.new("Mary Jane", "10 Independence Blvd", engineering) 

c.departments = [sales, engineering] 

# play with new methods 

c.users 

sales.users 

engineering.users 
class User 

  attr_accessor :name, :address 

  attr_reader :department 

  def initialize(name, address, department) 

    @name = name 

    @address = address 

    @department = department 

    department.users << self 

  end 

  # New method to keep the department's users up to date 

  # when a user's department instance variable is changed  

  def department=(new_department) 

    @department.users.delete(self) 

    @department = new_department 

    @department.users << self 

  end 

end 
c = Company.new("Acme Inc", "https://example.com") 

engineering = Department.new("Engineering") 

sales = Department.new("Sales") 

bob = User.new("Bob Smith", "1 Main Street", sales) 

mary = User.new("Mary Jane", "10 Independence Blvd", engineering) 

Engineering.users.map(&:name) 
bob.department = engineering 
engineering.users.map(&:name) 

sales.users.map(&:name) 
