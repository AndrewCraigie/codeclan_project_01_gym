
require_relative( '../db/sql_runner' )


class Song

  attr_reader :id
  attr_accessor :name, :artist, :duration

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @artist = options['artist']
    @duration = options['duration']  # Check input and output formats
  end

  # --- Class methods

  def self.delete_all()
    sql = "DELETE FROM songs"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM songs"
    results = SqlRunner.run(sql)
    return results.map { |song| Song.new(song)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM songs
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return Song.new(result)
  end

  def self.all_ordered(prop, direction)
    valid = ['id', 'name', 'artist', 'duration']
    if valid.include?(prop)
      sql = "SELECT * FROM songs ORDER BY #{prop} #{direction.upcase!}"
    else
      sql = "SELECT * FROM songs"
    end
    results = SqlRunner.run(sql)
    return results.map { |result| Song.new(result)}
  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO songs
          (name, artist, duration)
          VALUES
          ($1, $2, $3)
          RETURNING id"
    values = [@name, @artist, @duration]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE songs
      SET
      (name, artist, duration)
      =
      ($1, $2, $3)
      WHERE id = $4"
      values = [@name, @artist, @duration, @id]
      SqlRunner.run(sql, values)
    end

  def delete()
    sql = "DELETE FROM songs
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
