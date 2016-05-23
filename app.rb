
def twitter_description
	user = $client.user( "lmhadavies" )
	return user.description
end

get '/' do
	@tdesc = twitter_description
	erb :index
end

get '/ash/?' do
	erb :ash
end

get '/qr/?' do
	erb :qr
end

