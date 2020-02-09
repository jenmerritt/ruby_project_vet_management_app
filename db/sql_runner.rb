require('pg')

class SqlRunner

  def self.run( sql, values = [] )
    begin
      # db = PG.connect({ dbname: 'vet_practice', host: 'localhost' })
      db = PG.connect( {dbname: 'd399gbas0psb17', host: 'ec2-184-72-235-80.compute-1.amazonaws.com', port: 5432, user: 'nyrinknnhupfyx', password: '694d970ebe782fe5d71e7e99c656c20abdf772515dd4f6652649fc760d9c75fa'})
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
