require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/burger'
require_relative '../models/eatery'
require_relative '../models/deal'

get '/burgers/new' do
  erb(:"burgers/new")
end

get '/eateries/:id/burgers' do
 @eatery = Eatery.find_by_id(params[:id])
 @burgers = @eatery.burgers()
 erb(:"burgers/show")
end

get '/eateries/:id/burgers/new' do
  @eatery = Eatery.find_by_id(params['id'])
  erb(:'burgers/new')
end

post '/burgers' do
  params['eatery_id'] = Eatery.find_by_name(params['eatery_name']).id
  @eatery = Eatery.find_by_id(params['eatery_id'])
  @burger = Burger.new(params)
  @burger.save()
  redirect to "/eateries/#{@eatery.id}/burgers"
end

post '/eateries/:eatery_id/burgers/:id/delete' do
  burger = Burger.new(params)
  burger.delete()
  redirect to "/eateries/#{params['eatery_id']}/burgers"
end

get '/eateries/:eatery_id/burgers/:id/edit' do
  @burger = Burger.find_by_id(params['id'])
  erb(:"burgers/edit")
end

post '/eateries/:eatery_id/burgers/:id' do
  burger = Burger.new(params)
  burger.update()
  redirect to "/eateries/#{params['eatery_id']}/burgers"
end
