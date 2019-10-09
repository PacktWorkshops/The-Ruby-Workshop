module Address
  attr_accessor :address_line1, :address_line2, :city, :state, :postal_code, :country 

  def mailing_label
    label = []
    label << address_line1
    label << address_line2
    label << "#{city}, #{state} #{postal_code}"
    label << country
    label.join("\n")
  end

end

class User
  include Address
end

class Building
  include Address
end


u = User.new
b = Building.new
u.address_line1 = "123 Main Street"
b.address_line1 = "987 Broadway"


module EmailFormatter
  def email
    "#{first_name}.#{last_name}@#{domain}"
  end
end

module EmailSender
  def email(msg, sender, recipient)
    # contrived implementation for now
    puts "Delivering email to #{recipient} from #{sender} with message: #{msg}"
  end
end

class User
  attr_accessor :first_name, :last_name, :domain
  include EmailSender
  include EmailFormatter
end

u = User.new
u.first_name = "John"
u.last_name = "Smith"
u.domain = "example.com"

module Address
  attr_accessor :address_line1, :address_line2, :city, :state, :postal_code, :country 

  def mailing_label
    label = []
    label << address_line1
    label << address_line2
    label << address_line3
    label << address_line4
    label.reject(&:blank?).join("\n")
  end

  def address_line3
    if city
      "#{city}, #{state} #{postal_code}"
    else
      "#{state} #{postal_code}"
    end      
  end

  def address_line4
    country
  end

  def region
    case country
    when "US", "Canada", "Mexico"
      "North America"
    else
      "International"
    end
  end  
end

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


e = Employee.new
e.region
e.country = "Mexico"
e.region
e.department = Department.new
e.region
e.department.country = "England"
e.region



module HelperMethods
  def to_hash
    formatted_class_attributes = self.class.attributes_for_json.map{|attr| "@#{attr}".to_sym}
    filtered_ivars = self.instance_variables & formatted_class_attributes
    filtered_ivars.inject({}) do |map, iv|
      map[iv] = self.instance_variable_get(iv)  
      map
    end
  end

  module ClassMethods
    def attributes_for_json
      [:name, :email]
    end
  end

end

class User
  include HelperMethods
  extend HelperMethods::ClassMethods
  attr_accessor :id, :name, :email
end

u = User.new
u.id = 1
u.name = "Bob"
u.email = "bob@example.com"
u.to_hash


module SpyModule
  def self.included(base_class)
    puts "I've been included into: #{base_class}"
  end
end

class User
  include SpyModule
end

module SpyModule
  def self.extended(base_class)
    puts "I've been extended into: #{base_class}"
  end
end

class User
  extend SpyModule
end

module HelperMethods
  def self.included(base_class)
    puts "#{base_class} has included HelperMethods. We're also going to extend ClassMethods into it as well"
    base_class.extend(ClassMethods)
  end

  def to_hash
    formatted_class_attributes = self.class.attributes_for_json.map{|attr| "@#{attr}".to_sym}
    filtered_ivars = self.instance_variables & formatted_class_attributes
    filtered_ivars.inject({}) do |map, iv|
      map[iv] = self.instance_variable_get(iv)  
      map
    end
  end

  module ClassMethods
    def attributes_for_json
      [:name, :email]
    end
  end

end


class Payment
  attr_accessor :status

  APPROVED = 1
  DENIED = 2
  STATES = [APPROVED, DENIED]
end

payment = Payment.new
payment.status = Payment::APPROVED
payment.status


module Enum

  def self.included(base_class)
    base_class.extend ClassMethods
    base_class.class_eval do 
      attr_reader :id, :name, :label     
    end
  end  

  def initialize(id, name, label=nil)
    @id = id
    @name = name
    @label = label
  end

  def is_type?(type)
    name == type
  end

  def method_missing(method, *args, &block)
    interrogation_methods = all.map{|type| "#{type.name}?"}
    if interrogation_methods.include?(method)
      type = method.gsub("?", '').to_sym
      is_type?(type)
    else
      super
    end
  end

  module ClassMethods
    def all
      @all ||= begin
        self::DATA.map { |args| new(*args) }
      end
    end
  end
    
end

class PaymentTypes
  include Enum
  DATA = [
    [ WIRE = 1, :wire, "Wire"],
    [ CHECK = 2, :check, "Check"],
    [ CREDIT = 3, :credit, "Credit card"],    
  ]
end


module Zippy
  SKIPPY = "skippy"
  class Zappy
  end
  module Dappy
    def self.say_something
            puts "doo"
    end
  end
end

Zippy::SKIPPY
Zippy::Zappy.new
Zippy::Dappy.say_something

module PrependedModule
  def output
    puts "Outputting from the PrependedModule"
    super
  end

  def self.prepended(base_class)
    puts "Included: #{base_class}"
    base_class.instance_eval do
      def self.inherited(klass)
        puts "Inherited: #{klass}"
        klass.send(:prepend, PrependedModule)
      end
    end
  end
end

class ParentClass
  prepend PrependedModule

  def output
    puts "Outputting from the parent class"
  end
end

class ChildClass < ParentClass
  def output
    puts "Outputting from the child class"
  end
end
