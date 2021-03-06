ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
# require_relative 'models/user'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/places'
require_relative 'controllers/requests'
require_relative 'server'


class Makersbnb < Sinatra::Base



  get '/' do
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
