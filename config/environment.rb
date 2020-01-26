ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
Dotenv.load

ActiveRecord::Base.establish_connection("#{ENV['DATABASE_URL']}")

require_all 'app'
