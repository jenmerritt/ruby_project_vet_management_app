require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/appointment')
require_relative('../models/animal')
require_relative('../models/vet')
also_reload('../models/*')

get '/appointments' do
  @appointments = Appointment.all
  erb(:"appointments/index")
  # binding.pry
end

get '/appointments/new' do
  @appointments = Appointment.all
  @vets = Vet.all
  @animals = Animal.all
  erb (:"appointments/new")
end

post '/appointments/new' do
  @appointment = Appointment.new(params)
  @appointment.save()
  erb (:"appointments/create")
end

get '/appointments/today' do
  @appointments = Appointment.all
  erb (:"appointments/today")
end

get '/appointments/past' do
  @appointments = Appointment.all
  erb (:"appointments/past")
end

get '/appointments/future' do
  @appointments = Appointment.all
  erb (:"appointments/future")
end

# get '/appointments/:id' do
#   @appointment = Appointment.find(params[:id])
#   erb (:"appointments/show")
# end

get '/appointments/vet/:id' do
  @vet = Vet.find(params[:id])
  @appointments = Appointment.all
  erb (:"appointments/vet")
end

get '/appointments/animal/:id' do
  @animal = Animal.find(params[:id])
  @appointments = Appointment.all
  # @animals = Animal.all
  # @vets = Vet.all
  erb (:"appointments/animal")
end

# edit

get '/appointments/:id/edit' do
  @appointment = Appointment.find(params[:id])
  @animals = Animal.all
  @vets = Vet.all
  erb (:"appointments/edit")
end

# update

post '/appointments/:id/edit' do
  Appointment.new(params).update()
  erb (:"appointments/create")
end
