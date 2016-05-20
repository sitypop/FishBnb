class Makersbnb < Sinatra::Base

set :root, File.join(File.dirname(__FILE__), '')
register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::MethodOverride


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def convert_date_object(date_string)
      Date.parse(date_string)
    end

    def create_place(user)
      Place.create(
        name: params[:name],
        description: params[:description],
        price: params[:price].to_i,
        user_id: user.id,
        username: user.username)
    end

    def create_availability(place_id, start_date, end_date)
      Availability.create(
        start_date: start_date,
        end_date: end_date,
        place_id: place_id)
    end
  end

end
