
require_relative( '../db/sql_runner' )


class GymClass

  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']

  end

  # --- Class methods

  def delete_all()
    sql = "DELETE FROM gym_classes"
    SqlRunner.run(sql)
  end

  def all()
    sql = "SELECT * FROM gym_classes"
    results = SqlRunner.run(sql)
    return results.map { |gym_class| GymClass.new(gym_class)}
  end

  def find_by_id(id)
    sql = "SELECT * FROM gym_classes
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return GymClass.new(result)
  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO gym_classes
          ()
          VALUES
          ()
          RETURNING id"
    values = []
    result = SqlRunner.run(sql).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE gym_classes
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
    sql = "DELETE FROM gym_classes
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
