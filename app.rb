require 'sinatra'
require 'sinatra/contrib/all'
require_relative './controllers/eateries_controller'
require_relative './controllers/burgers_controller'

also_reload './models/*'
