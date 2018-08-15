
require_relative( '../db/sql_runner' )


class Role

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  # --- Class methods

  def self.delete_all()
    sql = "DELETE FROM roles"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM roles"
    results = SqlRunner.run(sql)
    return results.map { |role| Role.new(role)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM roles
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return Role.new(result)
  end

  def self.all_ordered(prop, direction)
    valid = ['id', 'name']
    if valid.include?(prop)
      sql = "SELECT * FROM roles ORDER BY #{prop} #{direction.upcase!}"
    else
      sql = "SELECT * FROM roles"
    end
    results = SqlRunner.run(sql)
    return results.map { |result| Role.new(result)}
  end

  def self.find_by_name(role_name)
    sql = "SELECT * FROM roles
      WHERE name LIKE $1"
    value = [role_name]
    result = SqlRunner.run(sql, value).first
    role = Role.new(result)
    puts "Role found #{role.name}  #{role.id}"
    return role
  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO roles
          (name)
          VALUES
          ($1)
          RETURNING id"
    value = [@name]
    result = SqlRunner.run(sql, value)
    @id = result[0]['id'].to_i()
  end

  def update()
      sql = "UPDATE roles
      SET
      name
      =
      $1
      WHERE id = $2"
      values = [@name, @id]
      SqlRunner.run(sql, values)
    end

  def delete()
    sql = "DELETE FROM roles
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


end
