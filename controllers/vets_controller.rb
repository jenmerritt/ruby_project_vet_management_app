require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/vet')
also_reload('../models/*')

get '/vets' do
  @vets = Vet.all
  erb(:"vets/index")
end

get '/vets/new' do
  erb (:"vets/new")
end

post '/vets/new' do
  @vet = Vet.new(params)
  @vet.save()
  erb (:"vets/create")
end

get '/vets/:id' do
  @vet = Vet.find(params[:id])
  erb (:"vets/show")
end

# edit

get '/vets/:id/edit' do
  @vet = Vet.find(params[:id])
  erb (:"vets/edit")
end

# update

post '/vets/:id/edit' do
  Vet.new(params).update()
  erb (:"vets/create")
end
