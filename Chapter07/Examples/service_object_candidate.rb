class User
  attr_accessor :name, :email, :address

  def initialize(name, email, address)
    @name = name
    @email = email
    @address = address
  end

  def create
    if save_to_database(self)
      send_invite_email
    end
  end

  private

  def send_invite_email
    mailgun = Mailgun::Client.new ENV['MAILGUN_API_KEY']
    params =  {
      from: "hello@myapp.com",
      to: email,
      subject: "Welcome #{name}!",
      text: "Thanks for signing up ...."
    }
    mailgun.send_message 'mail.myapp.com', params
  end
end