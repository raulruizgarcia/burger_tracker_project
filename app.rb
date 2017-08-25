require 'sinatra'
require 'sinatra/contrib/all'
require_relative './controllers/eateries_controller'

also_reload './models/*'

get '/eateries' do
 erb(:"eateries/index")
end
