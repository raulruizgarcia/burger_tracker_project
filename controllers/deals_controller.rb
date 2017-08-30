require 'sinatra'
require 'sinatra/contrib/all'
require 'date'
require_relative '../models/burger'
require_relative '../models/eatery'
require_relative '../models/deal'
require_relative '../models/burger_deal'
require 'pry'

get '/eateries/:id/deals/new' do
  @eatery = Eatery.find_by_id(params['id'].to_i)
  erb(:"eateries/new_deal")
end

post '/deals' do
  if params['eatery_id'].nil?
    params['eatery_id'] = Eatery.find_by_name(params['eatery_name']).id
  end


  deal = Deal.new(params)
  deal.save()
  redirect to "eateries/#{deal.eatery_id}/deals"
end

get '/eateries/:id/deals' do
  # binding.pry
  @eatery = Eatery.find_by_id(params[:id])
  @deals = @eatery.deals
  erb(:"deals/show")
end

get '/dow' do
  erb(:"deals/dow")
end

get '/dow/deals' do
  @deals = Deal.find_by_dow(params['dow_number'].to_i)
  erb(:"deals/dow_show")
end

get '/deals/new' do
  @eateries = Eatery.all()
  erb(:"deals/new")
end

get '/eateries/:eatery_id/deals/:id/edit' do
  @eatery = Eatery.find_by_id(params['eatery_id'])
  @deal = Deal.find_by_id(params['id'])
  erb(:"deals/edit")
end

post '/eateries/:eatery_id/deals/:id/delete' do
  deal = Deal.find_by_id(params['id'])
  deal.delete
  redirect to "/eateries/#{deal.eatery.id}/deals"
end

post '/eateries/:eatery_id/deals/:id' do
  deal = Deal.new(params)
  deal.update
  redirect to "/eateries/#{deal.eatery.id}/deals"
end
