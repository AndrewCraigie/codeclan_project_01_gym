
require_relative( '../db/sql_runner' )


class GymClassCategory

  attr_reader :id
  attr_accessor :name, :description

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
  end

  # --- Class methods

  def delete_all()
    sql = "DELETE FROM gym_class_categories"
    SqlRunner.run(sql)
  end

  def all()
    sql = "SELECT * FROM gym_class_categories"
    results = SqlRunner.run(sql)
    return results.map { |gym_class_category| GymClassCategory.new(gym_class_category)}
  end

  def find_by_id(id)
    sql = "SELECT * FROM gym_class_categories
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return GymClassCategory.new(result)
  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO gym_class_categories
          (name, description)
          VALUES
          ($1, $2)
          RETURNING id"
    values = [@name, @description]
    result = SqlRunner.run(sql).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE gym_class_categories
      SET
      (name, description)
       =
      ($1, $2)
      WHERE id = $3"
      values = [@name, @description, @id]
      SqlRunner.run(sql, values)
    end

  def delete()
    sql = "DELETE FROM gym_class_categories
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
