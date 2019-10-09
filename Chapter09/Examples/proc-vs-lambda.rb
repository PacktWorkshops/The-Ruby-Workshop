def my_lambda_method
    lambda { return "Statement from the block" }.call
    return "Statement from the method"
end
   
   puts my_lambda_method

   puts "******"

   def my_proc_method
    Proc.new { return "Statement from the block" }.call
    return "Statement from the method"
   end
   
   puts my_proc_method