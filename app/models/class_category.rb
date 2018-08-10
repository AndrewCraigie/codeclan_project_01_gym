
require_relative( '../db/sql_runner' )


class ClassCategory

  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']

  end

  # --- Class methods

  def delete_all()
    sql = "DELETE FROM class_categories"
    SqlRunner.run(sql)
  end

  def all()
    sql = "SELECT * FROM class_categories"
    results = SqlRunner.run(sql)
    return results.map { |class_category| ClassCategory.new(class_category)}
  end

  def find_by_id(id)
    sql = "SELECT * FROM class_categories
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return ClassCategory.new(result)
  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO class_categories
          ()
          VALUES
          ()
          RETURNING id"
    values = []
    result = SqlRunner.run(sql).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE class_categories
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
    sql = "DELETE FROM class_categories
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
