class User 

 

  def self.output 

    return "Global User" 

  end 

end 

 

module Report 

  def self.test_namespace 

    User.output 

  end 

 

  class User 

    def self.output 

      return "Report::User" 

    end 

  end 

end 
Report.test_namespace 
class User 

 

  def self.output 

    return "Global User" 

  end 

end 

 

module Report 

  def self.test_namespace 

    User.output 

  end 

 

  def self.test_global 

    ::User.output 

  end 

 

  class User 

    def self.output 

      return "Report::User" 

    end 

  end 

end 
