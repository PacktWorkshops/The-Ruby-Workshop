sum_of_range = ->(first, last) do
    result = 0
    (first..last).each do |i|
        result += i   
    end
    result
end

puts sum_of_range[1,6]