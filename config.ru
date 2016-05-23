require 'rubygems'
require 'bundler'
require 'sinatra'
require "sinatra/cookies"
require 'dotenv'
require 'rest-client'
require 'json'
require 'digest'
require 'twitter'

Bundler.require
Dotenv.load

$client = Twitter::REST::Client.new do |config|
  config.consumer_key    = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
end

# set up log levels
configure :test do
	set :logging, Logger::ERROR
end

configure :development do
	set :logging, Logger::DEBUG

	set(:cookie_options) do
		{ :expires => Time.now + 3600 * 24 * 5 }
	end
end

configure :production do
	set :logging, Logger::INFO

	set(:cookie_options) do
		{ :expires => Time.now + 3600 * 24 * 5 }
	end
end


require './app.rb'
run Sinatra::Application
