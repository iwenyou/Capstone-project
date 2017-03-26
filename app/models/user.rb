class User < ApplicationRecord
  has_secure_password

  has_many :groceries

  def self.send_email(user_id)
    sorted_groceries = Grocery.expiration_date_check(user_id)

    render_html = ApplicationController.new
    render_html.instance_variable_set(:@id, user_id)
    email_html = render_html.render_to_string(template: '_mail_template.html.erb :layout => false')

    data = {}
    data[:from] = "Wheat <wheatsanfrancisco@gmail.com>"
    data[:to] = "#{User.find(user_id).email}"
    # data[:cc] = "baz@example.com"
    # data[:bcc] = "bar@example.com"
    data[:subject] = "Hello"
    data[:text] = "Testing some Mailgun awesomness!"
    data[:html] = email_html.to_str
    # data[:attachment] = []
    # data[:attachment] << File.new(File.join("files", "test.jpg"))
    # data[:attachment] << File.new(File.join("files", "test.txt"))

    RestClient.post "https://api:#{ENV["Mailgun_api"]}"\
    "@api.mailgun.net/v3/www.wenzhang.rocks/messages",data
  end


end
