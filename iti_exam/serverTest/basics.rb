require 'sinatra'

get '/' do 
	"Hello World"
end

get '/about' do
  'I am beautiful eiei'
end

get '/hello/:name' do
	name_from_url=params[:name]
  "Hello,how are you, #{name_from_url.upcase} "
end

get '/form' do
	erb:form
end

post '/form' do
  "You said '#{params[:message]}'"
end

get '/secret' do
  erb :secret
end

post '/secret' do
  params[:secret].reverse
end

not_found do
  halt 404, 'not found ja bitch'
end