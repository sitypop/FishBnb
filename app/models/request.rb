class Request
  include DataMapper:: Resource

  property :id, Serial
  property :approved, Boolean, default: false
  property :host, String
  property :replied, Boolean, default: false
  property :declined, Boolean, default: false


  belongs_to :user
  belongs_to :place

end
