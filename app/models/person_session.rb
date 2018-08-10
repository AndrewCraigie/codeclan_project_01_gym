require ('person')
require ('session')
require_relative( '../db/sql_runner' )


class PersonSession

  attr_reader :id
  attr_accessor :date_time_added, :reserve, :session_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @date_time_added = ['date_time_added'] # TODO check input output format
    @reserve = options['reserve'].downcase == 'true'  # Convert to bool TODO check this
    @session_id = options['session_id'].to_i()
  end

  # --- Class methods

  def delete_all()
    sql = "DELETE FROM persons_sessions"
    SqlRunner.run(sql)
  end

  def all()
    sql = "SELECT * FROM persons_sessions"
    results = SqlRunner.run(sql)
    return results.map { |person_session| PersonSession.new(person_session)}
  end

  def find_by_id(id)
    sql = "SELECT * FROM persons_sessions
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return PersonSession.new(result)
  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO persons_sessions
          (date_time_added, reserve, session_id)
          VALUES
          ($1, $2, $3)
          RETURNING id"
    values = [@date_time_added, @reserve.to_s, @session_id]
    result = SqlRunner.run(sql).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE persons_sessions
      SET
      (date_time_added, reserve, session_id)
       =
      ($1, $2, $3)
      WHERE id = $4"
      values = [@date_time_added, @reserve.to_s, @session_id, @id]
      SqlRunner.run(sql, values)
    end

  def delete()
    sql = "DELETE FROM persons_sessions
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
