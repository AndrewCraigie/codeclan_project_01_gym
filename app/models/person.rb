
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
    @photo_url = options['photo_url']
    @role_id = options['role_id'].to_i()
  end

  # --- Class methods

  def delete_all()
    sql = "DELETE FROM persons"
    SqlRunner.run(sql)
  end

  def all()
    sql = "SELECT * FROM persons"
    results = SqlRunner.run(sql)
    return results.map { |person| Person.new(person)}
  end

  def find_by_id(id)
    sql = "SELECT * FROM persons
          WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value).first
    return Person.new(result)
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
    result = SqlRunner.run(sql).first()
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


end
