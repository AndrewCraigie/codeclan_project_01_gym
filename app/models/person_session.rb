
require_relative( '../db/sql_runner' )


class PersonSession

  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']

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
          ()
          VALUES
          ()
          RETURNING id"
    values = []
    result = SqlRunner.run(sql).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE persons_sessions
      SET
      (

      ) =
      (

      )
      WHERE id = $"
      values = [, @id]
      SqlRunner.run(sql, values)
    end

  def delete()
    sql = "DELETE FROM persons_sessions
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
