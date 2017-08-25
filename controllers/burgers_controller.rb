require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/burger'
require_relative '../models/eatery'
require_relative '../models/deal'

get '/burgers/:id' do
 @eatery = Eatery.find_by_id(params[:id])
 @burgers = @eatery.burgers()
 erb(:"burgers/show")
end

get '/burgers/new' do
  erb(:"burgers/new")
end
