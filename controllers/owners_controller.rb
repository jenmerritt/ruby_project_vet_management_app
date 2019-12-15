require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner')
also_reload('../models/*')

get '/owners' do
  @owners = Owner.all
  erb(:"owners/index")
end
