require 'sinatra'
require 'dotenv'

Dotenv.load



get '/' do
	erb :index
end

get '/ash/?' do
	erb :ash
end

