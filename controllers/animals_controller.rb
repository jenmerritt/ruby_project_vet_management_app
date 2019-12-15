require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/animal')
require_relative('../models/owner')
require_relative('../models/vet')
also_reload('../models/*')

get '/animals' do
  @animals = Animal.all
  erb(:"animals/index")
end

get '/animals/register' do
  @owners = Owner.all
  @vets = Vet.all
  erb (:"animals/new")
end

post '/animals/register' do
  @animal = Animal.new(params)
  @animal.save()
  erb (:"animals/create")
end

get '/animals/:id' do
  @animal = Animal.find(params[:id])
  erb (:"animals/show")
end

# edit

get '/animals/:id/edit' do
  @animal = Animal.find(params[:id])
  erb ( :edit)
end

# update

post '/animals/:id' do
  Animal.new(params).update()
  redirect to '/animals'
end
