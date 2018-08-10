
require_relative( '../db/sql_runner' )


class Message

  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']

  end

  # --- Class methods

  def delete_all()
    sql = "DELETE FROM messages"
    SqlRunner.run(sql)
  end

  def all()
    sql = "SELECT * FROM messages"
    results = SqlRunner.run(sql)
    return results.map { |message| Message.new(message)}
  end

  def find_by_id(id)
    sql = "SELECT * FROM messages
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return Message.new(result)
  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO messages
          ()
          VALUES
          ()
          RETURNING id"
    values = []
    result = SqlRunner.run(sql).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE messages
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
    sql = "DELETE FROM messages
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
