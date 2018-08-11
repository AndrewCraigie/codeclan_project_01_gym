require_relative ('person')
require_relative( '../db/sql_runner' )


class Message

  attr_reader :id
  attr_accessor :message, :date_time_added, :person_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @message = options['message']
    @date_time_added = options['date_time_added']  # Check input and output format
    @person_id = options['person_id'].to_i()
  end

  # --- Class methods

  def self.delete_all()
    sql = "DELETE FROM messages"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM messages"
    results = SqlRunner.run(sql)
    return results.map { |message| Message.new(message)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM messages
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return Message.new(result)
  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO messages
          (message, date_time_added, person_id)
          VALUES
          ($1, $2, $3)
          RETURNING id"
    values = [@message, @date_time_added, @person_id]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i()
    return @id
  end

  def update()
      sql = "UPDATE messages
      SET
      (message, date_time_added, person_id)
       =
      ($1, $2, $3)
      WHERE id = $4"
      values = [@message, @date_time_added, @person_id, @id]
      SqlRunner.run(sql, values)
    end

  def delete()
    sql = "DELETE FROM messages
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
