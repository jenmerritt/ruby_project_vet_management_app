require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner')
also_reload('../models/*')

get '/vets' do
  @vets = Vet.all
  erb(:"owners/index")
end
