def get_data(url, headers = {}, *params) 

  puts "Calling #{url}" 

 

  if headers.length > 0 

  puts "Headers: #{headers}" 

 else 

  puts "No headers" 

 end 

 

 params.each do |param| 

  puts "Found param: #{param}" 

 end 

end 
def assemble_params(include_headers = false, include_date_in_search = false, only_show_my_records = true) 

headers = {accept: "application/json"} 

url = "https://exampleapi.com" 

args = [url] 

args << headers if include_headers 

params = [] 

params << "date=#{Time.now}" if include_date_in_search 

params << "myrecords=true" if only_show_my_records 

args << params if params.length > 0 

end 
get_data(*assemble_params) 

get_data(*assemble_params(true)) 

get_data(*assemble_params(false, true, false)) 