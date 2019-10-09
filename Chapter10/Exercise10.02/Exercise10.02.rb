class Calculation 
    attr_accessor :first_number
    def sum 
        self.first_number + 2
    end
end

calc_obj1 = Calculation.new
calc_obj1.first_number = 10
puts calc_obj1.sum

class Calculation
    def sum
        self.first_number - 2
    end
end

calc_obj2 = Calculation.new
calc_obj2.first_number = 10
puts calc_obj2.sum