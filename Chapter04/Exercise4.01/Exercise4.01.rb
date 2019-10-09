def array_stats(input_array) 

  return sum, median, mean 

end 
def array_stats(input_array) 

 sum = input_array.inject(0){|total, i| total + i } 

  return sum 

end 
def array_stats(input_array) 

sum = input_array.inject(0){|total, i| total + i } 

mean = sum/input_array.length 

  return sum, mean 

end 
def calculate_median(array) 

  array = array.sort 

  if array.length.odd? 

    array[(array.length - 1) / 2] 

  else array.length.even? 

   (array[array.length/2] + array[array.length/2 - 1])/2.to_f 

  end 

end 
def array_stats(input_array) 

sum = input_array.inject(0){|total, i| total + i } 

mean = sum/input_array.length 

median = calculate_median(input_array) 

  return sum, mean, median 

end 
array_stats([1,2,3]) 

stats = array_stats([500, 12, 1, 99, 55, 12, 12]) 

sum, mean, median = array_stats([500, 12, 1, 99, 55, 12, 12]) 