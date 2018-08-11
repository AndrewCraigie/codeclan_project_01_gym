
require_relative( '../db/sql_runner' )


class Room

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  # --- Class methods

  def self.delete_all()
    sql = "DELETE FROM rooms"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM rooms"
    results = SqlRunner.run(sql)
    return results.map { |room| Room.new(room)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM rooms
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return Room.new(result)
  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO rooms
          (name)
          VALUES
          ($1)
          RETURNING id"
    value = [@name]
    result = SqlRunner.run(sql, value).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE rooms
      SET
      (name)
      =
      ($1)
      WHERE id = $2"
      values = [@name, @id]
      SqlRunner.run(sql, values)
    end

  def delete()
    sql = "DELETE FROM rooms
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
