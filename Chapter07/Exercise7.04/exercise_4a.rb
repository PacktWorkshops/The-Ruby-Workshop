class UserLister
  def initialize(users)
    @users = users
  end

  def perform
    @users.each_with_index do |user, idx|
      puts "User #{idx}: #{user}"
    end
  end
end