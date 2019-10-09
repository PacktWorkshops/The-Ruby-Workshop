class User 

 

  def public_method 

    puts "This is a public method" 

  end 

 

  protected 

  def protected_method 

    puts "This is a protected method" 

  end 

 

  private 

  def private_method 

    puts "This is a private method" 

  end 

end 
class User 

  def call_each 

    public_method 

    protected_method 

    private_method 

  end 

 

  def public_method 

    puts "This is a public method" 

  end 

 

  protected 

  def protected_method 

    puts "This is a protected method" 

  end 

 

  private 

  def private_method 

    puts "This is a private method" 

  end 

end 
u = User.new 

u.call_each. 


class User 

 

  def call_each 

    self.public_method 

    self.protected_method 

    self.private_method 

  end 

 

  def public_method 

    puts "This is a public method" 

  end 

 

  protected 

  def protected_method 

    puts "This is a protected method" 

  end 

 

  private 

  def private_method 

    puts "This is a private method" 

  end 

end 

 

u.call_each 

require 'digest' 

 

class User 

 

  def initialize(email) 

    @email = email 

  end 

 

  def ==(other) 

    self.unique_id == other.unique_id 

  end 

 

  protected 

  def unique_id 

    Digest::MD5.hexdigest @email.downcase 

  end 

end 

 

u = User.new("test@example.com") 

u2 = User.new("foo@example.com") 

u3 = User.new("TesT@EXAMPLE.COM") 

u == u2 

u == u3 
class Admin < User 

 

end 

 

class Department 

  def initialize(name) 

    @name = name 

  end 

 

  protected 

  def unique_id 

    Digest::MD5.hexdigest @name.downcase 

  end   

end 

 

admin = Admin.new("admin@example.com") 

admin2 = Admin.new("test@example.com") 

u == admin 

u == admin2 

u == sales 

