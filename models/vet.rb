require_relative( '../db/sql_runner' )

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

  def self.delete_all()
    sql = "DELETE FROM vets;"
    SqlRunner.run( sql )
  end

end
