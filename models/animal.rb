require_relative( '../db/sql_runner' )

class Animal

  attr_reader(:id)
  attr_accessor(:name, :dob, :category, :type, :owner_id, :vet_id, :treatment_notes, :status)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @dob = options['dob']
    @category = options['category']
    @type = options['type']
    @owner_id = options['owner_id'].to_i
    @vet_id = options['vet_id'].to_i
    @treatment_notes = options['treatment_notes']
    @status = options['status']
  end

  def save()
    sql = "INSERT INTO animals
    (
      name,
      dob,
      category,
      type,
      owner_id,
      vet_id,
      treatment_notes,
      status
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7, $8
    )
    RETURNING id;"
    values = [@name, @dob, @category, @type, @owner_id, @vet_id, @treatment_notes, @status]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM animals;"
    results = SqlRunner.run(sql)
    animals = map_items(results)
    return animals
  end

  def self.find(id)
    sql = "SELECT * FROM animals WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values)
    animal_hash = results[0]
    animal = Animal.new(animal_hash)
    return animal
  end

  def owner()
    sql = "SELECT * FROM owners WHERE id = $1;"
    values = [@owner_id]
    results = SqlRunner.run(sql, values)
    owner_hash = results[0]
    owner = Owner.new(owner_hash)
    return owner
  end

  def vet()
    sql = "SELECT * FROM vets WHERE id = $1;"
    values = [@vet_id]
    results = SqlRunner.run(sql, values)
    vet_hash = results[0]
    vet = Vet.new(vet_hash)
    return vet
  end

  def appointments()
    sql = "SELECT * FROM appointments where animal_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    appointment_hash = results[0]
    appointment = Appointment.new(appointment_hash)
    return appointment
  end

  def update()
    sql = "
    UPDATE animals SET (
      name,
      dob,
      category,
      type,
      owner_id,
      vet_id,
      treatment_notes,
      status
    ) =
    (
      $1, $2, $3, $4, $5, $6, $7, $8
    )
    WHERE id = $9;"
    values = [@name, @dob, @category, @type, @owner_id, @vet_id, @treatment_notes, @status, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete(id)
    sql = "DELETE FROM animals where id = $1;"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM animals;"
    SqlRunner.run(sql)
  end

  def self.map_items(animal_data)
    return animal_data.map { |animal| Animal.new(animal) }
  end

end
