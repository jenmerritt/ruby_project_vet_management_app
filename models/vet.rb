require_relative( '../db/sql_runner' )
require_relative('./animal')

class Vet

  attr_reader(:id)
  attr_accessor(:name, :mobile, :animal_category, :status)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @mobile = options['mobile']
    @animal_category = options['animal_category']
    @status = options['status']
  end

  def save()
    sql = "INSERT INTO vets
    (
      name,
      mobile,
      animal_category,
      status
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id;"
    values = [@name, @mobile, @animal_category, @status]
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
    appointments = results.map { |appointment| Appointment.new(appointment) }
    return appointments
  end

  def update()
    sql = "
    UPDATE vets SET (
      name,
      mobile,
      animal_category,
      status
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5;"
    values = [@name, @mobile, @animal_category, @id, @status]
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
