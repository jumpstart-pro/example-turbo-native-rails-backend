User.find_or_create_by!(email_address: "user@example.com") do |user|
  user.password = "password"
end
