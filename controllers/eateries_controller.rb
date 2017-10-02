require 'sinatra'
require 'sinatra/contrib/all' if development?
require_relative '../models/burger'
require_relative '../models/eatery'
require_relative '../models/deal'

get '/eateries' do
 @eateries = Eatery.all
 erb(:"eateries/index")
end

get '/eateries/new' do
  erb(:"eateries/new")
end

get '/eateries/:id/edit' do
  @eatery = Eatery.find_by_id(params[:id])
  erb(:"eateries/edit")
end

post '/eateries' do
  params['logo_url'] = '/burger_icon.png' if params['logo_url'] == ""
  eatery = Eatery.new(params)
  eatery.save
  redirect to '/eateries'
end

post '/eateries/:id' do
  eatery = Eatery.new(params)
  eatery.update()
  redirect to '/eateries'
end

post '/eateries/:id/delete' do
  eatery = Eatery.find_by_id(params['id'])
  eatery.delete
  redirect to '/eateries'
end

get '/' do
  erb(:index)
end
