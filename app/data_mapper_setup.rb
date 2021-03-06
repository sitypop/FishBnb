require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/user'
require_relative 'models/place'
require_relative 'models/request'
require_relative 'models/availability'



DataMapper.setup(:default, ENV["DATABASE_URL"] || "postgres://localhost/makers_bnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
