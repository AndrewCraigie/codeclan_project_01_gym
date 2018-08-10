
require_relative( '../db/sql_runner' )


class Session

  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']

  end

  # --- Class methods

  def delete_all()
    sql = "DELETE FROM sessions"
    SqlRunner.run(sql)
  end

  def all()
    sql = "SELECT * FROM sessions"
    results = SqlRunner.run(sql)
    return results.map { |classname| Session.new(result)}
  end

  def find_by_id(id)
    sql = "SELECT * FROM sessions
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return Session.new(result)
  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO sessions
          ()
          VALUES
          ()
          RETURNING id"
    values = []
    result = SqlRunner.run(sql).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE sessions
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
    sql = "DELETE FROM sessions
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
