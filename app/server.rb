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
  end

end
