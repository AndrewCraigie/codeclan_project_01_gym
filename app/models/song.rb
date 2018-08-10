
require_relative( '../db/sql_runner' )


class Song

  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']

  end

  # --- Class methods

  def delete_all()
    sql = "DELETE FROM songs"
    SqlRunner.run(sql)
  end

  def all()
    sql = "SELECT * FROM songs"
    results = SqlRunner.run(sql)
    return results.map { |song| Song.new(song)}
  end

  def find_by_id(id)
    sql = "SELECT * FROM songs
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return Song.new(result)
  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO songs
          ()
          VALUES
          ()
          RETURNING id"
    values = []
    result = SqlRunner.run(sql).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE songs
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
    sql = "DELETE FROM songs
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
