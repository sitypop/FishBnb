class Place
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :description, Text, required: true
  property :price, Integer, required: true
  property :booked, Boolean, default: false
  property :username, String

  belongs_to :user
  has n, :requests

end
