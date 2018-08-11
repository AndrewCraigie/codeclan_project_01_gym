
require_relative( '../db/sql_runner' )


class GymClassesCategory

  attr_reader :id
  attr_accessor :class_id, :gym_class_category_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @class_id = options['class_id'].to_i()
    @gym_class_category_id = options['gym_class_category_id'].to_i()
  end

  # --- Class methods

  def self.delete_all()
    sql = "DELETE FROM gym_classes_categories"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM gym_classes_categories"
    results = SqlRunner.run(sql)
    return results.map { |gym_classes_category| GymClassesCategory.new(gym_classes_category)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM gym_classes_categories
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return GymClassesCategory.new(result)
  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO gym_classes_categories
          (class_id, gym_class_category_id)
          VALUES
          ($1, $2)
          RETURNING id"
    values = [@class_id, @gym_class_category_id]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE gym_classes_categories
      SET
      (class_id, gym_class_category_id)
       =
      ($1, $2)
      WHERE id = $3"
      values = [@class_id, @gym_class_category_id, @id]
      SqlRunner.run(sql, values)
    end

  def delete()
    sql = "DELETE FROM gym_classes_categories
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
