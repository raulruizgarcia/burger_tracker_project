require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/burger'
require_relative '../models/eatery'
require_relative '../models/deal'
require_relative '../models/burger_deal'
require 'pry'

get '/eateries/:id/deals/new' do
  @eatery = Eatery.find_by_id(params['id'].to_i)
  erb(:"deals/new")
end

post '/deals' do
  params['eatery_id'] = Eatery.find_by_name(params['eatery_name']).id


  deal = Deal.new(params)
  deal.save()

  params['deal_id'] = deal.id

  burger_deal = BurgerDeal.new(params)
  burger_deal.save

end
