require_relative('../models/animal.rb')
require_relative('../models/vet.rb')
require_relative('../models/owner.rb')
require('pry')

Animal.delete_all()
Vet.delete_all()
Owner.delete_all()

owner1 = Owner.new({
  "first_name" => "Mary",
  "last_name" => "Crawley",
  "phone_number" => "01234567890",
  "address" => "Downton Abbey, Yorkshire",
  "postcode" => "YO10 7PP",
  "status" => "registered"
  })

owner1.save()

owner2 = Owner.new({
  "first_name" => "Anna",
  "last_name" => "Smith",
  "phone_number" => "01234567890",
  "address" => "Small Cottage, Yorkshire",
  "postcode" => "YO10 9KL",
  "status" => "registered"
  })

owner2.save()

owner3 = Owner.new({
  "first_name" => "Tom",
  "last_name" => "Branson",
  "phone_number" => "01234567890",
  "address" => "The Old Garage, Yorkshire",
  "postcode" => "YO20 7HO",
  "status" => "registered"
  })

owner3.save()

owner4 = Owner.new({
  "first_name" => "Charles",
  "last_name" => "Carson",
  "phone_number" => "01234567890",
  "address" => "New House, Yorkshire",
  "postcode" => "YO12 4FD",
  "status" => "unregistered"
  })

owner4.save()

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

animal1 = Animal.new({
  "name" => "Spot",
  "dob" => "01/06/2010",
  "category" => "small",
  "type" => "dog",
  "owner_id" => owner1.id,
  "vet_id" => vet2.id,
  "treatment_notes" => "Previous treatments include blah blah blah"
  })

animal1.save()

animal2 = Animal.new({
  "name" => "Tiger",
  "dob" => "12/08/2012",
  "category" => "small",
  "type" => "cat",
  "owner_id" => owner2.id,
  "vet_id" => vet4.id,
  "treatment_notes" => "Previous treatments include blah blah blah"
  })

animal2.save()

animal3 = Animal.new({
  "name" => "Titan",
  "dob" => "21/07/2014",
  "category" => "large",
  "type" => "horse",
  "owner_id" => owner3.id,
  "vet_id" => vet1.id,
  "treatment_notes" => "Previous treatments include blah blah blah"
  })

animal3.save()

animal4 = Animal.new({
  "name" => "Daisy",
  "dob" => "13/08/2013",
  "category" => "large",
  "type" => "cow",
  "owner_id" => owner4.id,
  "vet_id" => vet3.id,
  "treatment_notes" => "Previous treatments include blah blah blah"
  })

animal4.save()

animal5 = Animal.new({
  "name" => "Fluffy",
  "dob" => "11/09/2017",
  "category" => "small",
  "type" => "rabbit",
  "owner_id" => owner1.id,
  "vet_id" => vet5.id,
  "treatment_notes" => "Previous treatments include blah blah blah"
  })

animal5.save()

animal6 = Animal.new({
  "name" => "Scruffy",
  "dob" => "11/09/2017",
  "category" => "small",
  "type" => "rabbit",
  "owner_id" => owner1.id,
  "vet_id" => vet2.id,
  "treatment_notes" => "Previous treatments include blah blah blah"
  })

animal6.save()

binding.pry
nil
