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
end
