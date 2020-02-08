require('sinatra')
# require('sinatra/contrib/all') if development?
require_relative('../models/owner')

# index - list all owners

get 'owners' do
  @owners = Owner.all
  erb(:"owners/index")
end

# new and create - register owner

get '/owners/register' do
  erb (:"owners/new")
end

post '/owners/register' do
  @owner = Owner.new(params)
  @owner.save()
  erb (:"owners/create")
end

# show - owner by id

get '/owners/:id' do
  @owner = Owner.find(params[:id])
  erb (:"owners/show")
end

# edit and update - amend owner

get '/owners/:id/edit' do
  @owner = Owner.find(params[:id])
  erb (:"owners/edit")
end

post '/owners/:id/edit' do
  Owner.new(params).update()
  erb (:"owners/create")
end
