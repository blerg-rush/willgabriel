class Message
  include ActiveModel::Model
  attr_accessor :name, :email, :phone_number, :body
  validates :name, :body, presence: true
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  def send
    mg_client = Mailgun::Client.new ENV["MAILGUN_SECRET_API_KEY"]
    info = {
      from: email,
      to: "will.gabriel@gmail.com",
      subject: "Message from #{name} - willgabriel.dev",
      text: "From: #{name}, Email: #{email}, Phone: #{phone_number} \n\n #{body}"
    }
    mg_client.send_message "mail.willgabriel.dev", info
  end
end
