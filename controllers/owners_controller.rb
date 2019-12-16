require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner')
also_reload('../models/*')

get '/owners' do
  @owners = Owner.all
  erb(:"owners/index")
end

get '/owners/register' do
  erb (:"owners/new")
end

post '/owners/register' do
  @owner = Owner.new(params)
  @owner.save()
  erb (:"owners/create")
end

get '/owners/:id' do
  @owner = Owner.find(params[:id])
  erb (:"owners/show")
end

# edit

get '/owners/:id/edit' do
  @owner = Owner.find(params[:id])
  erb (:"owners/edit")
end

# update

post '/owners/:id/edit' do
  Owner.new(params).update()
  erb (:"owners/create")
end
