require('pry')
require_relative( '../db/sql_runner' )

class Appointment

  attr_reader(:id)
  attr_accessor(:date, :time, :vet_id, :animal_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @date = options['date']
    @time = options['time']
    @vet_id = options['vet_id']
    @animal_id = options['animal_id']
  end

  def save()
    sql = "INSERT INTO appointments
    (
      date,
      time,
      vet_id,
      animal_id
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id;"
    values = [@date, @time, @vet_id, @animal_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM appointments;"
    results = SqlRunner.run(sql)
    appointments = map_items(results)
    return appointments
  end

  def update()
    sql = "
    UPDATE appointments SET (
      date,
      time,
      vet_id,
      animal_id
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5;"
    values = [@date, @time, @vet_id, @animal_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete(id)
    sql = "DELETE FROM appointments where id = $1;"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM appointments;"
    SqlRunner.run(sql)
  end

  def self.map_items(appointment_data)
    return appointment_data.map { |appointment| Appointment.new(appointment) }
  end

  def self.find(id)
    sql = "SELECT * FROM appointments WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values)
    appointments_hash = results[0]
    appointment = Appointment.new(appointments_hash)
    return appointment
  end


end
