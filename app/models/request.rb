class Request
  include DataMapper:: Resource

  property :id, Serial
  property :approved, Boolean, default: false
  

  belongs_to :user
  belongs_to :place

end
