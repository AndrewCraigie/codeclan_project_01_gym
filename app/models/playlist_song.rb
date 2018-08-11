
require_relative( '../db/sql_runner' )


class PlaylistSong

  attr_reader :id
  attr_accessor :class_id, :song_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @class_id = options['class_id'].to_i()
    @song_id = options['song_id'].to_i()
  end

  # --- Class methods

  def self.delete_all()
    sql = "DELETE FROM playlist_songs"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM playlist_songs"
    results = SqlRunner.run(sql)
    return results.map { |playlist_song| PlaylistSong.new(playlist_song)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM playlist_songs
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return PlaylistSong.new(result)
  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO playlist_songs
          (class_id, song_id)
          VALUES
          ($1, $2)
          RETURNING id"
    values = [@class_id, @song_id]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE playlist_songs
      SET
      (class_id, song_id)
       =
      ($1, $2)
      WHERE id = $3"
      values = [@class_id, @song_id, @id]
      SqlRunner.run(sql, values)
    end

  def delete()
    sql = "DELETE FROM playlist_songs
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
