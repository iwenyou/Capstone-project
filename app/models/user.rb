class User < ApplicationRecord
  has_secure_password

  has_many :groceries

  def send_simple_message
    RestClient.post "https://api:#{ENV["Mailgun_api"]}"\
    "@api.mailgun.net/v3/www.wenzhang.rocks/messages",
    :from => "Wheat <wheatsanfrancisco@gmail.com>",
    :to => "iwenyou@gmail.com",
    :subject => "Hello",
    :text => "Testing some Mailgun awesomness!"
  end


end
