def time
  Time.now
end
create_login = time.to_s.gsub(/([ +:-])/, '')
password =  ('0'..'z').to_a.shuffle.first(8).join
email = create_login + "@gmail.com"
puts create_login

