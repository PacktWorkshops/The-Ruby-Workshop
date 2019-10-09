def math(array) 

end 
def math(array) 

  first_item = array.shift 
  while(array.length > 0) do
  second_item = array.shift
  first_item = yield first_item, second_item 

  end 

  return first_item 

end 
def math(array) 

  first_item = array.shift 

  while(array.length > 1) do 

    second_item = array.shift || 0 

    third_item = array.shift || 0 

    first_item = yield first_item, second_item, third_item 

  end 

  return first_item 

end 