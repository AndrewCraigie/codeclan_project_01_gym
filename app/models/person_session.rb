require_relative ('person')
require_relative ('session')
require_relative( '../db/sql_runner' )


class PersonSession

  attr_reader :id
  attr_accessor :date_time_added, :reserve, :person_id, :session_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @date_time_added = DateTime.parse(options['date_time_added'])
    @reserve = options['reserve'].downcase == 'true' ||  options['reserve'].downcase == 't'
    @person_id = options['person_id'].to_i()
    @session_id = options['session_id'].to_i()
  end

  # --- Class methods

  def self.delete_all()
    sql = "DELETE FROM persons_sessions"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM persons_sessions"
    results = SqlRunner.run(sql)
    return results.map { |person_session| PersonSession.new(person_session)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM persons_sessions
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return PersonSession.new(result)
  end

  def self.find_by_person_session(person_id, session_id)
    sql = "SELECT * FROM persons_sessions
          WHERE person_id = $1
          AND session_id = $2"
    values = [person_id, session_id]
    results = SqlRunner.run(sql, values)
    return results.map {|result| PersonSession.new(result)}
  end

  def self.update_reserves(session_id)
    # check spaces
    session = Session.find_by_id(session_id)
    spaces_available = session.available_count()

    #get reserves
    if spaces_available > 0
      sql = "SELECT * FROM persons_sessions
            WHERE session_id = $1
            AND reserve = 't'
            ORDER BY date_time_added ASC
            LIMIT $2"
      values = [session.id, spaces_available.to_i]
      results = SqlRunner.run(sql, values)

      results.each do |result|
        person_session = PersonSession.new(result)
        person_session.reserve = 'false'
        person_session.update()
      end

    end


  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO persons_sessions
          (date_time_added, reserve, person_id, session_id)
          VALUES
          ($1, $2, $3, $4)
          RETURNING id"
    values = [@date_time_added.to_s, @reserve.to_s.upcase, @person_id, @session_id]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE persons_sessions
      SET
      (date_time_added, reserve, person_id, session_id)
       =
      ($1, $2, $3, $4)
      WHERE id = $5"
      values = [@date_time_added.to_s, @reserve.to_s.upcase, @person_id, @session_id, @id]
      SqlRunner.run(sql, values)
    end

  def delete()
    sql = "DELETE FROM persons_sessions
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
