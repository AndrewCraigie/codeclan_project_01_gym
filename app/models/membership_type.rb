
require_relative( '../db/sql_runner' )


class MembershipType

  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']

  end

  # --- Class methods

  def delete_all()
    sql = "DELETE FROM membership_types"
    SqlRunner.run(sql)
  end

  def all()
    sql = "SELECT * FROM membership_types"
    results = SqlRunner.run(sql)
    return results.map { |classname| MembershipType.new(result)}
  end

  def find_by_id(id)
    sql = "SELECT * FROM membership_types
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return MembershipType.new(result)
  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO membership_types
          ()
          VALUES
          ()
          RETURNING id"
    values = []
    result = SqlRunner.run(sql).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE membership_types
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
    sql = "DELETE FROM membership_types
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
