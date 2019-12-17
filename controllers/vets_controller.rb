require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/vet')
also_reload('../models/*')

# index - list all vets

get '/vets' do
  @vets = Vet.all
  erb(:"vets/index")
end

# new and create - add vet

get '/vets/new' do
  erb (:"vets/new")
end

post '/vets/new' do
  @vet = Vet.new(params)
  @vet.save()
  erb (:"vets/create")
end

# show - list specific vet by id

get '/vets/:id' do
  @vet = Vet.find(params[:id])
  erb (:"vets/show")
end

# edit and update - amend vet

get '/vets/:id/edit' do
  @vet = Vet.find(params[:id])
  erb (:"vets/edit")
end

post '/vets/:id/edit' do
  Vet.new(params).update()
  erb (:"vets/create")
end
