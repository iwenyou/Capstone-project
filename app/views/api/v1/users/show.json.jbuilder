json.id @user.id
json.first_name @user.first_name
json.last_name @user.last_name
json.email @user.email
json.groceries @user.groceries.each do |grocery|
  json.id grocery.id
  json.name grocery.name
end
