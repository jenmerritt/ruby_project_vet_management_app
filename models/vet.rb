require_relative( '../db/sql_runner' )
require_relative('./animal')

class Vet

  attr_reader(:id)
  attr_accessor(:name, :mobile, :animal_category)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @mobile = options['mobile']
    @animal_category = options['animal_category']
  end

  def save()
    sql = "INSERT INTO vets
    (
      name,
      mobile,
      animal_category
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id;"
    values = [@name, @mobile, @animal_category]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM vets;"
    results = SqlRunner.run(sql)
    vets = map_items(results)
    return vets
  end

  def self.find(id)
    sql = "SELECT * FROM vets WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values)
    vet_hash = results[0]
    vet = Vet.new(vet_hash)
    return vet
  end

  def animals()
    sql = "SELECT * FROM animals
    WHERE vet_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    animals = results.map {|animal| Animal.new(animal)}
    return animals
  end

  def appointments()
    sql = "SELECT * FROM appointments where vet_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    appointment_hash = results[0]
    appointment = Appointment.new(appointment_hash)
    return appointment
  end

  def update()
    sql = "
    UPDATE vets SET (
      name,
      mobile,
      animal_category
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4;"
    values = [@name, @mobile, @animal_category, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete(id)
    sql = "DELETE FROM vets where id = $1;"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM vets;"
    SqlRunner.run(sql)
  end

  def self.map_items(vet_data)
    return vet_data.map { |vet| Vet.new(vet) }
  end

end
