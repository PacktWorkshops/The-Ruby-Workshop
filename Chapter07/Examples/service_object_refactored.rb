require "mailgun-ruby"

class UserInviter
  def initialize(user)
    @user = user
  end

  def perform
    mailgun = Mailgun::Client.new ENV['MAILGUN_API_KEY']
    mailgun.send_message 'mail.myapp.com', params
  end

  private

  def params
    {
      from: "hello@myapp.com",
      to: @user.email,
      subject: "Welcome #{@user.name}!",
      text: "Thanks for signing up ...."
    }
  end
end

class User
  attr_accessor :name, :email, :address

  def initialize(name, email, address)
    @name = name
    @email = email
    @address = address
  end

  def create
    if save_to_database(self)
      UserInviter.new(email).perform
    end
  end
end