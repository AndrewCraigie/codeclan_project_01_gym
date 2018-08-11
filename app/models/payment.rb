require_relative ('person')
require_relative( '../db/sql_runner' )


class Payment

  attr_reader :id
  attr_accessor :description, :amount, :person_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @description = options['description']
    @amount = options['amount'].to_f
    @person_id = options['person_id'].to_i()
  end

  # --- Class methods

  def self.delete_all()
    sql = "DELETE FROM payments"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM payments"
    results = SqlRunner.run(sql)
    return results.map { |payment| Payment.new(payment)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM payments
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return Payment.new(result)
  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO payments
          (description, amount, person_id)
          VALUES
          ($1, $2, $3)
          RETURNING id"
    values = [@description, @amount, @person_id]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE payments
      SET
      (description, amount, person_id)
      =
      ($1, $2, $3)
      WHERE id = $1"
      values = [@description, @amount, @person_id, @id]
      SqlRunner.run(sql, values)
    end

  def delete()
    sql = "DELETE FROM payments
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
