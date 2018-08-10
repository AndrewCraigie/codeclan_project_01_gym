
require_relative( '../db/sql_runner' )


class Intensity

  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']

  end

  # --- Class methods

  def delete_all()
    sql = "DELETE FROM intensities"
    SqlRunner.run(sql)
  end

  def all()
    sql = "SELECT * FROM intensities"
    results = SqlRunner.run(sql)
    return results.map { |intensity| Intensity.new(intensity)}
  end

  def find_by_id(id)
    sql = "SELECT * FROM intensities
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return Intensity.new(result)
  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO intensities
          ()
          VALUES
          ()
          RETURNING id"
    values = []
    result = SqlRunner.run(sql).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE intensities
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
    sql = "DELETE FROM intensities
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
