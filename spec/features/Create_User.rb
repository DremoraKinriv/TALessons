users = Hash.new
def create_user
  create_login = Time.now.to_s.gsub(/([ +:-])/, '')
  password =  ('0'..'z').to_a.shuffle.first(8).join
  users[create_login.to_sym]=password
  email = create_login + "@gmail.com"
  puts users
end
create_user
puts users