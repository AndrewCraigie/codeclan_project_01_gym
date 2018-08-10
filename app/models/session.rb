require ('person')
require ('gym_class')
require ('room')
require_relative( '../db/sql_runner' )


class Session

  attr_reader :id
  attr_accessor :date, :start_time, :end_time, :capacity, :gym_class_id, :instructor_id, :room_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @date = options['date']  #  Check input and output format
    @start_time = options['start_time']  # Check input and output format
    @end_time = options['end_time'] # Chekc input and output format
    @capacity = options['capacity'].to_i()
    @gym_class_id = options['gym_class_id'].to_i()
    @instructor_id = options['instructor_id'].to_i()
    @room_id = options['room_id'].to_i()
  end

  # --- Class methods

  def delete_all()
    sql = "DELETE FROM sessions"
    SqlRunner.run(sql)
  end

  def all()
    sql = "SELECT * FROM sessions"
    results = SqlRunner.run(sql)
    return results.map { |session| Session.new(session)}
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
          (date, start_time, end_time, capacity, gym_class_id, instructor_id, room_id)
          VALUES
          ($1, $2, $3, $4, $5, $6, $7)
          RETURNING id"
    values = [@date, @start_time, @end_time, @capacity, @gym_class_id, @instructor_id, @room_id]
    result = SqlRunner.run(sql).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE sessions
      SET
      (date,
        start_time,
        end_time,
        capacity,
        gym_class_id,
        instructor_id,
        room_id
      ) =
      ($1, $2, $3, $4, $5, $6, $7)
      WHERE id = $8"
      values = [@date, @start_time, @end_time, @capacity, @gym_class_id, @instructor_id, @room_id, @id]
      SqlRunner.run(sql, values)
    end

  def delete()
    sql = "DELETE FROM sessions
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
