class User
  include DataMapper:: Resource

  property :id, Serial
  property :first_name,   String, required: true
  property :last_name, String, required: true
  property :username, String, required: true, :unique => true
  property :email, String, required: true, :unique => true
  property :password, String, required: true
  property :confirm_password, String, required: true

end
