require 'sinatra'
require 'sinatra/contrib/all' if development?
require_relative '../models/burger'
require_relative '../models/eatery'
require_relative '../models/deal'
require_relative '../models/burger_deal'

get '/deals/:id/burger_deals/new' do
  @deal = Deal.find_by_id(params['id'])
  @eatery = @deal.eatery
  erb(:"burger_deals/new")
end

post '/deals/:id/burger_deals' do
  deal = Deal.find_by_name(params['deal_name'])
  # eatery = Deal.find_by_id(deal_id)
  eatery = Eatery.find_by_name(params['eatery_name'])
  params['deal_id'] = deal.id

  @burger_deal = BurgerDeal.new(params)
  if @burger_deal.save
    redirect "/eateries/#{eatery.id}/deals"
  else
    redirect "/deals/#{deal.id}/burger_deals/new"
  end

end

# post 'deals/:deal_id/burger_deals/:id/delete' do
#   deal = Deal.find_by_id(params['deal_id'])
#   redirect to "/eateries/#{deal.eatery.id}/"
# end

get '/deals/:id' do
  @deal = Deal.find_by_id(params[:id])
  erb(:"burger_deals/delete")
end

post '/deals/:id/delete' do
  deal = Deal.find_by_name(params['deal_name'])
  params['deal_id'] = deal.id
  burger_deal = BurgerDeal.find_by_burger_and_deal(params['burger_id'], params['deal_id'])
  burger_deal.delete()
  redirect to "eateries/#{deal.eatery.id}/deals"
end
