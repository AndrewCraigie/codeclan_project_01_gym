
require_relative( '../db/sql_runner' )


class Room

  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']

  end

  # --- Class methods

  def delete_all()
    sql = "DELETE FROM rooms"
    SqlRunner.run(sql)
  end

  def all()
    sql = "SELECT * FROM rooms"
    results = SqlRunner.run(sql)
    return results.map { |classname| Room.new(result)}
  end

  def find_by_id(id)
    sql = "SELECT * FROM rooms
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return Room.new(result)
  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO rooms
          ()
          VALUES
          ()
          RETURNING id"
    values = []
    result = SqlRunner.run(sql).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE rooms
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
    sql = "DELETE FROM rooms
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
