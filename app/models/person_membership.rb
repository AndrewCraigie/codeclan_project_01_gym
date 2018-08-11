
require_relative( '../db/sql_runner' )


class PersonMembership

  attr_reader :id
  attr_accessor :person_id, :membership_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @person_id = options['person_id'].to_i()
    @membership_id = options['membership_id'].to_i()
  end

  # --- Class methods

  def self.delete_all()
    sql = "DELETE FROM persons_memberships"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM persons_memberships"
    results = SqlRunner.run(sql)
    return results.map { |person_membership| PersonMembership.new(person_membership)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM persons_memberships
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return PersonMembership.new(result)
  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO persons_memberships
          (person_id, membership_id)
          VALUES
          ($1, $2)
          RETURNING id"
    values = [@person_id, @membership_id]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE persons_memberships
      SET
      (person_id, membership_id)
       =
      ($1, $2)
      WHERE id = $3"
      values = [@person_id, @membership_id, @id]
      SqlRunner.run(sql, values)
    end

  def delete()
    sql = "DELETE FROM persons_memberships
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
