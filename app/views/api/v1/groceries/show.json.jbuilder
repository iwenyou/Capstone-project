json.id @grocery.id
json.name @grocery.name
json.made_by @grocery.made_by
json.expiration_date @grocery.expiration_date
json.catagories @grocery.catagories.each do |catagory|
  json.id catagory.id
  json.name catagory.name
end
