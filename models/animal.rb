require_relative( '../db/sql_runner' )

class Animal

  attr_reader(:id)
  attr_accessor(:name, :dob, :category, :type, :owner_id, :vet_id, :treatment_notes)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @dob = options['dob']
    @category = options['category']
    @type = options['type']
    @owner_id = options['owner_id'].to_i
    @vet_id = options['vet_id'].to_i
    @treatment_notes = options['treatment_notes']
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
      treatment_notes
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    RETURNING id;"
    values = [@name, @dob, @category, @type, @owner_id, @vet_id, @treatment_notes]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM animals;"
    results = SqlRunner.run(sql)
    return results.map {|animal| Animal.new(animal)}
  end

  def self.find(id)
    sql = "SELECT * FROM animals WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values)
    animal_hash = results[0]
    animal = Animal.new(animal_hash)
    return animal
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
      treatment_notes
    ) =
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    WHERE id = $8;"
    values = [@name, @dob, @category, @type, @owner_id, @vet_id, @treatment_notes, @id]
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

end
