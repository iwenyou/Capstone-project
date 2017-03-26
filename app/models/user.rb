class User < ApplicationRecord
  has_secure_password

  has_many :groceries

  def self.send_email(user_id)
    sorted_groceries = Grocery.expiration_date_check(user_id)

    data = {}
    data[:from] = "Wheat <wheatsanfrancisco@gmail.com>"
    data[:to] = "#{User.find(user_id).email}"
    # data[:cc] = "baz@example.com"
    # data[:bcc] = "bar@example.com"
    data[:subject] = "Hello"
    data[:text] = "Testing some Mailgun awesomness!"
    data[:html] = "<html></html>"
    # data[:attachment] = []
    # data[:attachment] << File.new(File.join("files", "test.jpg"))
    # data[:attachment] << File.new(File.join("files", "test.txt"))

    RestClient.post "https://api:#{ENV["Mailgun_api"]}"\
    "@api.mailgun.net/v3/www.wenzhang.rocks/messages",data
  end


end
