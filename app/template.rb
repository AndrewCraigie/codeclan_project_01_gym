
require_relative( '../db/sql_runner' )


class ClassName

  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']

  end

  # --- Class methods

  def self.delete_all()
    sql = "DELETE FROM classname"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM tablename"
    results = SqlRunner.run(sql)
    return results.map { |classname| Classname.new(result)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM tablename
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return Classname.new(result)
  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO tablename
          ()
          VALUES
          ()
          RETURNING id"
    values = []
    result = SqlRunner.run(sql).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE tablename
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
    sql = "DELETE FROM tablename
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
