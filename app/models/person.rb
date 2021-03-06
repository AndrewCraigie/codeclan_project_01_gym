require ('pry')
require_relative ('membership')
require_relative( '../db/sql_runner' )


class Person

  attr_reader :id
  attr_accessor :first_name, :last_name, :street_address, :city, :postcode,
                :telephone_number, :mobile_number, :email_address, :photo_url, :role_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @street_address = options['street_address']
    @city = options['city']
    @postcode = options['postcode']
    @telephone_number = options['telephone_number']
    @mobile_number = options['mobile_number']
    @email_address = options['email_address']
    @photo_url = options['photo_url'] == "" ? 'blank.jpg' : options['photo_url']
    @role_id = options['role_id'].to_i()
  end

  # --- Class methods

  def self.delete_all()
    sql = "DELETE FROM persons"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM persons"
    results = SqlRunner.run(sql)
    return results.map { |person| Person.new(person)}
  end

  def self.all_by_role(role_id)
    sql = "SELECT * FROM persons
          WHERE role_id = $1"
    value = [role_id]
    results = SqlRunner.run(sql, value)
    return results.map { |result| Person.new(result)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM persons
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    if result != nil
      return Person.new(result)
    else
      return nil
    end
  end

  def self.all_ordered(prop, direction)
    valid = ['id', 'first_name', 'last_name', 'street_address', 'city', 'postcode', 'telephone_number', 'mobile_number', 'email_address', 'photo_url', 'role_id']
    if valid.include?(prop)
      sql = "SELECT * FROM persons ORDER BY #{prop} #{direction.upcase!}"
    else
      sql = "SELECT * FROM persons"
    end
    results = SqlRunner.run(sql)
    return results.map { |result| Person.new(result)}
  end

  # --- Instance methods

  def save()
    sql = "INSERT INTO persons
          (
            first_name,
            last_name,
            street_address,
            city,
            postcode,
            telephone_number,
            mobile_number,
            email_address,
            photo_url,
            role_id
          )
          VALUES
          ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
          RETURNING id"
    values = [
      @first_name,
      @last_name,
      @street_address,
      @city,
      @postcode,
      @telephone_number,
      @mobile_number,
      @email_address,
      @photo_url,
      @role_id
    ]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i()
  end

  def update()
      sql = "UPDATE persons
      SET
      (
        first_name,
        last_name,
        street_address,
        city,
        postcode,
        telephone_number,
        mobile_number,
        email_address,
        photo_url,
        role_id
      ) =
      ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
      WHERE id = $11"
      values = [
        @first_name,
        @last_name,
        @street_address,
        @city,
        @postcode,
        @telephone_number,
        @mobile_number,
        @email_address,
        @photo_url,
        @role_id,
        @id
      ]
      SqlRunner.run(sql, values)
    end

  def delete()
    sql = "DELETE FROM persons
          WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end

  def role()
    sql = "SELECT name FROM roles
          WHERE id = $1"
    value = [@role_id]
    result = SqlRunner.run(sql, value).first
    return result['name']
  end

  def membership()
    sql = "SELECT memberships.*
    FROM memberships
    INNER JOIN persons_memberships
    ON memberships.id = persons_memberships.membership_id
    INNER JOIN persons
    ON persons_memberships.person_id = persons.id
    WHERE persons.id = $1"
    value = [@id]
    result = SqlRunner.run(sql,value).first
    if result.empty?
      return "none"
    else
      return Membership.new(result)
    end

  end

  def pretty_name()
    return "#{@first_name.capitalize} #{@last_name.capitalize}"
  end

  # def membership_id()
  #   sql = "SELECT * FROM persons_memberships
  #         WHERE person_id = $1"
  #   value = [@id]
  #   result = SqlRunner.run(sql, value).first
  #   if result != nil
  #     return result['membersip_id']
  #   else
  #     return "none"
  #   end
  #
  #
  # end


end
