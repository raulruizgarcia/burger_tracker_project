require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/burger'
require_relative '../models/eatery'
require_relative '../models/deal'

get '/deals/new' do
  erb(:"deals/new")
end
