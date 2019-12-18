require_relative('../models/appointment.rb')
require_relative('../models/animal.rb')
require_relative('../models/vet.rb')
require_relative('../models/owner.rb')
require('pry')

Appointment.delete_all()
Animal.delete_all()
Vet.delete_all()
Owner.delete_all()


######################
# OWNERS
########################

owner1 = Owner.new({
  "first_name" => "Mary",
  "last_name" => "Crawley",
  "phone_number" => "01234567890",
  "address" => "Downton Abbey, Yorkshire",
  "postcode" => "YO10 7PP",
  "status" => "active"
  })

owner1.save()

owner2 = Owner.new({
  "first_name" => "Anna",
  "last_name" => "Smith",
  "phone_number" => "01234567890",
  "address" => "Small Cottage, Yorkshire",
  "postcode" => "YO10 9KL",
  "status" => "active"
  })

owner2.save()

owner3 = Owner.new({
  "first_name" => "Tom",
  "last_name" => "Branson",
  "phone_number" => "01234567890",
  "address" => "The Old Garage, Yorkshire",
  "postcode" => "YO20 7HO",
  "status" => "active"
  })

owner3.save()

owner4 = Owner.new({
  "first_name" => "Charles",
  "last_name" => "Carson",
  "phone_number" => "01234567890",
  "address" => "New House, Yorkshire",
  "postcode" => "YO12 4FD",
  "status" => "inactive"
  })

owner4.save()

owner5 = Owner.new({
  "first_name" => "Cora",
  "last_name" => "Crawley",
  "phone_number" => "01234567890",
  "address" => "Farm, Yorkshire",
  "postcode" => "YO40 7HJ",
  "status" => "active"
  })

owner5.save()

owner6 = Owner.new({
  "first_name" => "Lily",
  "last_name" => "James",
  "phone_number" => "01234567890",
  "address" => "House, Street",
  "postcode" => "YO20 9KH",
  "status" => "active"
  })

owner6.save()

owner7 = Owner.new({
  "first_name" => "Mrs",
  "last_name" => "Hughes",
  "phone_number" => "01234567890",
  "address" => "Cottage, Lane",
  "postcode" => "YO34 2DS",
  "status" => "inactive"
  })

owner7.save()

owner8 = Owner.new({
  "first_name" => "Mr",
  "last_name" => "Bates",
  "phone_number" => "01234567890",
  "address" => "Another Cottage, Yorkshire",
  "postcode" => "YO10 2ER",
  "status" => "inactive"
  })

owner8.save()

owner9 = Owner.new({
  "first_name" => "Daisy",
  "last_name" => "Mason",
  "phone_number" => "01234567890",
  "address" => "Downstairs, Downton Abbey",
  "postcode" => "YO40 7HJ",
  "status" => "active"
  })

owner9.save()

owner10 = Owner.new({
  "first_name" => "Henry",
  "last_name" => "Talbot",
  "phone_number" => "01234567890",
  "address" => "Garage, Yorkshire",
  "postcode" => "YO54 3RT",
  "status" => "active"
  })

owner10.save()



######################
# VETS
########################



vet1 = Vet.new({
  "name" => "Jack Bishop",
  "mobile" => "01234567890",
  "animal_category" => "large"
  })

vet1.save()

vet2 = Vet.new({
  "name" => "Nikki Smith",
  "mobile" => "01234567890",
  "animal_category" => "small"
  })

vet2.save()

vet3 = Vet.new({
  "name" => "Julia Fields",
  "mobile" => "01234567890",
  "animal_category" => "large"
  })

vet3.save()

vet4 = Vet.new({
  "name" => "Will Evans",
  "mobile" => "01234567890",
  "animal_category" => "small"
  })

vet4.save()

vet5 = Vet.new({
  "name" => "Laura Williams",
  "mobile" => "01234567890",
  "animal_category" => "small"
  })

vet5.save()




######################
# ANIMALS
########################



animal1 = Animal.new({
  "name" => "Fang",
  "dob" => "01/06/2010",
  "category" => "small",
  "type" => "dog",
  "owner_id" => owner1.id,
  "vet_id" => vet2.id,
  "treatment_notes" => "10/2/2019: flea treatment",
  "status" => "active"
  })

animal1.save()

animal2 = Animal.new({
  "name" => "Tiger",
  "dob" => "12/08/2012",
  "category" => "small",
  "type" => "cat",
  "owner_id" => owner2.id,
  "vet_id" => vet4.id,
  "treatment_notes" => "14/05/2019: food allergy tests",
  "status" => "active"
  })

animal2.save()

animal3 = Animal.new({
  "name" => "Titan",
  "dob" => "21/07/2014",
  "category" => "large",
  "type" => "horse",
  "owner_id" => owner3.id,
  "vet_id" => vet1.id,
  "treatment_notes" => "18/09/2019: laminitus treatments, 10/10/2019: follow up laminitus check",
  "status" => "active"
  })

animal3.save()

animal4 = Animal.new({
  "name" => "Daisy",
  "dob" => "13/08/2013",
  "category" => "large",
  "type" => "cow",
  "owner_id" => owner4.id,
  "vet_id" => vet3.id,
  "treatment_notes" => "12/05/2016: calving",
  "status" => "inactive"
  })

animal4.save()

animal5 = Animal.new({
  "name" => "Fluffy",
  "dob" => "11/09/2017",
  "category" => "small",
  "type" => "rabbit",
  "owner_id" => owner5.id,
  "vet_id" => vet2.id,
  "treatment_notes" => "None",
  "status" => "active"
  })

animal5.save()

animal6 = Animal.new({
  "name" => "Scruffy",
  "dob" => "11/09/2017",
  "category" => "small",
  "type" => "rabbit",
  "owner_id" => owner5.id,
  "vet_id" => vet2.id,
  "treatment_notes" => "None",
  "status" => "active"
  })

animal6.save()

animal7 = Animal.new({
  "name" => "Crookshanks",
  "dob" => "03/04/2018",
  "category" => "small",
  "type" => "cat",
  "owner_id" => owner1.id,
  "vet_id" => vet2.id,
  "treatment_notes" => "03/05/2018: kitten checkup, 03/08/2018: kitten checkup 2",
  "status" => "active"
  })

animal7.save()

animal8 = Animal.new({
  "name" => "Buckbeak",
  "dob" => "06/05/1999",
  "category" => "large",
  "type" => "horse",
  "owner_id" => owner8.id,
  "vet_id" => vet1.id,
  "treatment_notes" => "None",
  "status" => "inactive"
  })

animal8.save()

animal9 = Animal.new({
  "name" => "Bramble",
  "dob" => "11/04/2015",
  "category" => "large",
  "type" => "sheep",
  "owner_id" => owner8.id,
  "vet_id" => vet3.id,
  "treatment_notes" => "01/04/2019: lambing",
  "status" => "inactive"
  })

animal9.save()

animal10 = Animal.new({
  "name" => "Hedwig",
  "dob" => "29/02/2015",
  "category" => "small",
  "type" => "parrot",
  "owner_id" => owner9.id,
  "vet_id" => vet5.id,
  "treatment_notes" => "None",
  "status" => "active"
  })

animal10.save()

animal11 = Animal.new({
  "name" => "Errol",
  "dob" => "29/02/2015",
  "category" => "small",
  "type" => "parrot",
  "owner_id" => owner9.id,
  "vet_id" => vet5.id,
  "treatment_notes" => "None",
  "status" => "active"
  })

animal11.save()

animal12 = Animal.new({
  "name" => "Snuffles",
  "dob" => "01/12/2019",
  "category" => "small",
  "type" => "dog",
  "owner_id" => owner6.id,
  "vet_id" => vet4.id,
  "treatment_notes" => "10/12/2019: puppy checkup",
  "status" => "active"
  })

animal12.save()

animal13 = Animal.new({
  "name" => "Spot",
  "dob" => "01/11/2019",
  "category" => "small",
  "type" => "dog",
  "owner_id" => owner10.id,
  "vet_id" => vet4.id,
  "treatment_notes" => "10/11/2019: puppy checkup",
  "status" => "active"
  })

animal13.save()

######################
# APPOINTMENTS
########################

appointment7 = Appointment.new({
  "date" => Date.new(2019, 12, 19),
  "time" => "09:00 - 10:00",
  "vet_id" => vet1.id,
  "animal_id" => animal3.id
  })

appointment7.save()

appointment13 = Appointment.new({
  "date" => Date.new(2019, 12, 19),
  "time" => "09:00 - 10:00",
  "vet_id" => vet3.id,
  "animal_id" => animal9.id
  })

appointment13.save()

appointment3 = Appointment.new({
  "date" => Date.new(2019, 12, 19),
  "time" => "11:00 - 12:00",
  "vet_id" => vet2.id,
  "animal_id" => animal1.id
  })

appointment3.save()

appointment5 = Appointment.new({
  "date" => Date.new(2019, 12, 19),
  "time" => "11:00 - 12:00",
  "vet_id" => vet4.id,
  "animal_id" => animal2.id
  })

appointment5.save()

appointment8 = Appointment.new({
  "date" => Date.new(2019, 12, 19),
  "time" => "12:00 - 13:00",
  "vet_id" => vet3.id,
  "animal_id" => animal4.id
  })

appointment8.save()

appointment11 = Appointment.new({
  "date" => Date.new(2019, 12, 19),
  "time" => "14:00 - 15:00",
  "vet_id" => vet1.id,
  "animal_id" => animal8.id
  })

appointment11.save()

appointment9 = Appointment.new({
  "date" => Date.new(2019, 12, 19),
  "time" => "15:00 - 16:00",
  "vet_id" => vet2.id,
  "animal_id" => animal5.id
  })

appointment9.save()

appointment19 = Appointment.new({
  "date" => Date.new(2019, 12, 19),
  "time" => "16:00 - 17:00",
  "vet_id" => vet4.id,
  "animal_id" => animal13.id
  })

appointment19.save()

appointment1 = Appointment.new({
  "date" => Date.new(2019, 11, 1),
  "time" => "09:00 - 10:00",
  "vet_id" => vet2.id,
  "animal_id" => animal1.id
  })

appointment1.save()

appointment2 = Appointment.new({
  "date" => Date.new(2019, 12, 18),
  "time" => "10:00 - 11:00",
  "vet_id" => vet2.id,
  "animal_id" => animal1.id
  })

appointment2.save()

appointment4 = Appointment.new({
  "date" => Date.new(2019, 10, 1),
  "time" => "14:00 - 15:00",
  "vet_id" => vet2.id,
  "animal_id" => animal7.id
  })

appointment4.save()

appointment6 = Appointment.new({
  "date" => Date.new(2019, 9, 5),
  "time" => "16:00 - 17:00",
  "vet_id" => vet4.id,
  "animal_id" => animal2.id
  })

appointment6.save()

appointment10 = Appointment.new({
  "date" => Date.new(2019, 11, 1),
  "time" => "15:00 - 16:00",
  "vet_id" => vet2.id,
  "animal_id" => animal5.id
  })

appointment10.save()

appointment12 = Appointment.new({
  "date" => Date.new(2019, 10, 01),
  "time" => "12:00 - 13:00",
  "vet_id" => vet3.id,
  "animal_id" => animal9.id
  })

appointment12.save()

appointment14 = Appointment.new({
  "date" => Date.new(2019, 12, 20),
  "time" => "09:00 - 10:00",
  "vet_id" => vet5.id,
  "animal_id" => animal10.id
  })

appointment14.save()

appointment15 = Appointment.new({
  "date" => Date.new(2019, 12, 20),
  "time" => "10:00 - 11:00",
  "vet_id" => vet5.id,
  "animal_id" => animal11.id
  })

appointment15.save()

appointment16 = Appointment.new({
  "date" => Date.new(2019, 11, 1),
  "time" => "10:00 - 11:00",
  "vet_id" => vet5.id,
  "animal_id" => animal10.id
  })

appointment16.save()

appointment17 = Appointment.new({
  "date" => Date.new(2019, 12, 21),
  "time" => "12:00 - 13:00",
  "vet_id" => vet4.id,
  "animal_id" => animal12.id
  })

appointment17.save()

appointment18 = Appointment.new({
  "date" => Date.new(2019, 9, 21),
  "time" => "12:00 - 13:00",
  "vet_id" => vet4.id,
  "animal_id" => animal12.id
  })

appointment18.save()



# binding.pry
# nil
