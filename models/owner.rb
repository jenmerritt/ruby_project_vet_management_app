require_relative( '../db/sql_runner' )

class Owner

  attr_reader(:id)
  attr_accessor(:first_name, :last_name, :phone_number, :address, :postcode, :status, :notes)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @phone_number = options['phone_number']
    @address = options['address']
    @postcode = options['postcode']
    @status = options['status']
    @notes = options['notes'] if options['notes']
  end

  def save()
    sql = "INSERT INTO owners
    (
      first_name,
      last_name,
      phone_number,
      address,
      postcode,
      status,
      notes
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    RETURNING id;"
    values = [@first_name, @last_name, @phone_number, @address, @postcode, @status, @notes]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM owners;"
    results = SqlRunner.run(sql)
    return results.map {|owner| Owner.new(owner)}
  end

  def self.find(id)
    sql = "SELECT * FROM owners WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values)
    owner_hash = results[0]
    owner = Owner.new(owner_hash)
    return owner
  end

  def update()
    sql = "
    UPDATE owners SET (
      first_name,
      last_name,
      phone_number,
      address,
      postcode,
      status,
      notes
    ) =
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    WHERE id = $8;"
    values = [@first_name, @last_name, @phone_number, @address, @postcode, @status, @notes, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete(id)
    sql = "DELETE FROM owners where id = $1;"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM owners;"
    SqlRunner.run(sql)
  end


end
