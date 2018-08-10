
require_relative( '../db/sql_runner' )


class Payment

  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']

  end

  # --- Class methods

  def delete_all()
    sql = "DELETE FROM payments"
    SqlRunner.run(sql)
  end

  def all()
    sql = "SELECT * FROM tablename"
    results = SqlRunner.run(sql)
    return results.map { |payment| Payment.new(payment)}
  end

  def find_by_id(id)
    sql = "SELECT * FROM payments
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return Payment.new(result)
  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO payments
          ()
          VALUES
          ()
          RETURNING id"
    values = []
    result = SqlRunner.run(sql).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE payments
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
    sql = "DELETE FROM payments
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
