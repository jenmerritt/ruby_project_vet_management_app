require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/appointment')
require_relative('../models/animal')
require_relative('../models/vet')
also_reload('../models/*')

# index - list all appointments

get '/appointments' do
  @appointments = Appointment.all
  erb(:"appointments/index")
end

# new and create - new appointment

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

# list all appointments on a specific date

get '/appointments/date/:date' do
  @date = params[:date]
  @date_hash = Date.parse(@date)
  @appointments = Appointment.all
  erb (:"appointments/date")
end

# refactored above
# get '/appointments/date/date/:date' do
#   @date = params[:date]
#   @appointments = Appointment.all
#   erb(:"appointments/date")
# end

# list all appointments in the past

get '/appointments/past' do
  @appointments = Appointment.all
  erb (:"appointments/past")
end

# list all appointments in the future

get '/appointments/future' do
  @appointments = Appointment.all
  erb (:"appointments/future")
end

# list all appointments by vet

get '/appointments/vet/:id' do
  @vet = Vet.find(params[:id])
  @appointments = @vet.appointments
  erb (:"appointments/vet")
end

# list all appointments by animal

get '/appointments/animal/:id' do
  @animal = Animal.find(params[:id])
  @appointments = @animal.appointments
  erb (:"appointments/animal")
end

# edit and update - amend an appointment

get '/appointments/:id/edit' do
  @appointment = Appointment.find(params[:id])
  @animals = Animal.all
  @vets = Vet.all
  erb (:"appointments/edit")
end

post '/appointments/:id/edit' do
  Appointment.new(params).update()
  erb (:"appointments/create")
end
