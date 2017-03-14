json.array! @groceries do |grocery|
  json.id grocery.id
  json.name grocery.name
  json.user_id grocery.user_id
  json.expiration_date grocery.expiration_date
  json.catagories grocery.catagories.each do |catagory|
    json.id catagory.id
    json.name catagory.name
  end

end
