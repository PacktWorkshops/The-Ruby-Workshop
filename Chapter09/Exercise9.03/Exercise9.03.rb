sum_of_range = Proc.new do |first, last| 
    result = 0
    (first..last).each do |i|
        result += i   
    end
    result
end

puts sum_of_range.call(1,6)