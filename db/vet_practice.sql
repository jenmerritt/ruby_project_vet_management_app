DROP TABLE appointments;
DROP TABLE animals;
DROP TABLE owners;
DROP TABLE vets;

CREATE TABLE vets (
  id SERIAL primary key,
  name VARCHAR(255),
  mobile VARCHAR(255),
  animal_category VARCHAR(255)
);

CREATE TABLE owners (
  id SERIAL primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  phone_number VARCHAR(255),
  address VARCHAR(255),
  postcode VARCHAR(255),
  status VARCHAR(255),
  notes TEXT
);

CREATE TABLE animals (
  id SERIAL primary key,
  name VARCHAR(255),
  dob VARCHAR(255),
  category VARCHAR(255),
  type VARCHAR(255),
  owner_id INT REFERENCES owners(id),
  vet_id INT REFERENCES vets(id),
  treatment_notes TEXT,
  status VARCHAR(255)
);

CREATE TABLE appointments (
  id SERIAL primary key,
  a_date VARCHAR(255),
  a_time VARCHAR(255),
  vet_id INT REFERENCES vets(id),
  animal_id INT REFERENCES animals(id)
);
