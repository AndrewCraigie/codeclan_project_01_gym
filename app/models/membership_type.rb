
require_relative( '../db/sql_runner' )


class MembershipType

  attr_reader :id
  attr_accessor :name, :description

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
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
          (name, description)
          VALUES
          ($1, $2)
          RETURNING id"
    values = [@name, @description]
    result = SqlRunner.run(sql).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE membership_types
      SET
      (name, description)
       =
      ($1, $2)
      WHERE id = $3"
      values = [@name, @description, @id]
      SqlRunner.run(sql, values)
    end

  def delete()
    sql = "DELETE FROM membership_types
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end