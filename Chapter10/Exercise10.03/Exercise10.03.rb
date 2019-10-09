require 'ostruct'

class Company
    def initialize(name, id, location)
        @name = name
        @id = id
        @location = location
    end 

    def employee
        OpenStruct.new(name: @name, id: @id, location: @location) 
    end

    def method_missing(method_name, *args, &block)
        if method_name.to_s =~ /employee_(.*)/
            employee.send($1, *args, &block)
        else
            super
        end 
    end

    def respond_to_missing?(method_name, include_private = false)
        method_name.to_s.start_with?('employee') || super
    end
end 

new_employee = Company.new("Akshat", "007", "Tokyo")
puts new_employee.employee_location
puts new_employee.respond_to?(:employee_location)


