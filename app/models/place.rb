class Place
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :description, Text, required: true
  property :price, Integer, required: true
  property :booked, Boolean, default: false

  belongs_to :user
  has n, :availabilitys

end
