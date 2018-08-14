
require_relative( '../db/sql_runner' )


class Intensity

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  # --- Class methods

  def self.delete_all()
    sql = "DELETE FROM intensities"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM intensities"
    results = SqlRunner.run(sql)
    return results.map { |intensity| Intensity.new(intensity)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM intensities
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return Intensity.new(result)
  end

  def self.all_ordered(prop, direction)
    valid = ['id', 'name']
    if valid.include?(prop)
      sql = "SELECT * FROM intensities ORDER BY #{prop} #{direction.upcase!}"
    else
      sql = "SELECT * FROM intensities"
    end
    results = SqlRunner.run(sql)
    return results.map { |result| Intensity.new(result)}
  end


  # --- Instance methods

  def save()
    sql = "INSERT INTO intensities
          (name) VALUES ($1)
          RETURNING id"
    value = [@name]
    result = SqlRunner.run(sql, value).first()
    @id = result['id'].to_i()
    return @id
  end

  def update()
      sql = "UPDATE intensities
      SET
      name
       =
      $1
      WHERE id = $2"
      values = [@name, @id]
      SqlRunner.run(sql, values)
    end

  def delete()
    sql = "DELETE FROM intensities
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
