require_relative ('membership_type')
require_relative( '../db/sql_runner' )


class Membership

  attr_reader :id
  attr_accessor :membership_number, :start_date, :end_date, :membership_type_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @membership_number = options['membership_number'].to_i()
    @start_date = options['start_date'] # TODO check input output format
    @end_date = options['end_date'] # TODO check input output format
    @membership_type_id = options['membership_type_id'].to_i()
  end

  # --- Class methods

  def self.delete_all()
    sql = "DELETE FROM memberships"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM memberships"
    results = SqlRunner.run(sql)
    return results.map { |membership| Membership.new(membership)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM memberships
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return Membership.new(result)
  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO memberships
          (membership_number, start_date, end_date, membership_type_id)
          VALUES
          ($1, $2, $3, $4)
          RETURNING id"
    values = [@membership_number, @start_date, @end_date, @membership_type_id]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE memberships
      SET
      (membership_number, start_date, end_date, membership_type_id)
       =
      ($1, $2, $3, $4)
      WHERE id = $5"
      values = [@membership_number, @start_date, @end_date, @membership_type_id, @id]
      SqlRunner.run(sql, values)
    end

  def delete()
    sql = "DELETE FROM memberships
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
