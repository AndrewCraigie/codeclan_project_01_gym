require ('date')
require_relative ('person')
require_relative ('gym_class')
require_relative ('room')
require_relative ('booking')
require_relative( '../db/sql_runner' )


class Session

  attr_reader :id
  attr_accessor :session_date, :start_time, :end_time, :capacity, :gym_class_id, :instructor_id, :room_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    # @session_date = options['session_date']  #  DATE Check input and output format
    @start_time = DateTime.parse(options['start_time'])  # TIME Check input and output format
    @end_time = DateTime.parse(options['end_time']) # TIME Chekc input and output format
    @capacity = options['capacity'].to_i()
    @gym_class_id = options['gym_class_id'].to_i()
    @instructor_id = options['instructor_id'].to_i()
    @room_id = options['room_id'].to_i()
  end

  # --- Class methods

  def self.delete_all()
    sql = "DELETE FROM sessions"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM sessions"
    results = SqlRunner.run(sql)
    return results.map { |session| Session.new(session)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM sessions
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return Session.new(result)
  end

  def self.all_ordered(prop, direction)
    valid = ['id', 'start_time', 'end_time', 'capacity', 'gym_class_id',
              'instructor_id', 'room_id']
    if valid.include?(prop)
      sql = "SELECT * FROM sessions ORDER BY #{prop} #{direction.upcase!}"
    else
      sql = "SELECT * FROM sessions"
    end
    results = SqlRunner.run(sql)
    return results.map { |result| Session.new(result)}
  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO sessions
          ( start_time, end_time, capacity, gym_class_id, instructor_id, room_id)
          VALUES
          ($1, $2, $3, $4, $5, $6)
          RETURNING id"
    values = [@start_time.to_s, @end_time.to_s, @capacity, @gym_class_id, @instructor_id, @room_id]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE sessions
      SET
      (
        start_time,
        end_time,
        capacity,
        gym_class_id,
        instructor_id,
        room_id
      ) =
      ($1, $2, $3, $4, $5, $6)
      WHERE id = $7"
      values = [@start_time.to_s, @end_time.to_s, @capacity, @gym_class_id, @instructor_id, @room_id, @id]
      SqlRunner.run(sql, values)
    end

  def delete()
    sql = "DELETE FROM sessions
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end

  def date()
    return @start_time.strftime("%F")
  end

  def start()
    return @start_time.strftime("%H:%M")
  end

  def duration
    duration_seconds = ((@end_time - @start_time) * 24 * 3600).to_i
    duration_hours = duration_seconds / 3600
    duration_mins = (duration_seconds % 3600) / 60
    return "#{duration_hours}:#{duration_mins}"
  end

  def gym_class_name()
    sql = "SELECT name FROM gym_classes
          WHERE id = $1"
    value = [@gym_class_id]
    result = SqlRunner.run(sql, value).first
    return result['name']
  end

  def booked()
    sql = "SELECT persons.*, persons_sessions.date_time_added, persons_sessions.reserve
    FROM sessions
    INNER JOIN persons_sessions
    ON sessions.id = persons_sessions.session_id
    INNER JOIN persons
    ON persons_sessions.person_id = persons.id
    WHERE persons_sessions.reserve = FALSE"
    results = SqlRunner.run(sql)
    bookings = []

    results.each do |result|
      person = Person.new(result)
      date_time_added = result['date_time_added']
      reserve = result['reserve']
      bookings << Booking.new(person, self, date_time_added, reserve)
    end

    return bookings
  end

  def reserve()
    sql = "SELECT persons.*, persons_sessions.date_time_added, persons_sessions.reserve
    FROM sessions
    INNER JOIN persons_sessions
    ON sessions.id = persons_sessions.session_id
    INNER JOIN persons
    ON persons_sessions.person_id = persons.id
    WHERE persons_sessions.reserve = TRUE"
    results = SqlRunner.run(sql)
    reserves = []

    results.each do |result|
      person = Person.new(result)
      date_time_added = result['date_time_added']
      reserve = result['reserve']
      reserves << Booking.new(person, self, date_time_added, reserve)
    end

    return reserves
  end

  def spaces_available()
    sql = "SELECT COUNT(session_id)
          FROM persons_sessions
          WHERE session_id = $1"
    value = [@id]
    result = SqlRunner.run(sql, value).first

    if result['count'].to_i < @capacity
      puts "result: #{result['count'].to_i} #{@capacity} true"
      return true
    else
      puts "result: #{result['count'].to_i} #{@capacity} false"
      return false
    end

  end


end
