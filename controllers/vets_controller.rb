require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/vet')
also_reload('../models/*')

get '/vets' do
  @vets = Vet.all
  erb(:"vets/index")
end

get '/vets/:id' do
  @vet = Vet.find(params[:id])
  erb (:"vets/show")
end
