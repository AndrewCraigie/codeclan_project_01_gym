require ('pry')
require_relative ('person')
require_relative( '../db/sql_runner' )


class Booking

  attr_reader :person, :date_time_added, :reserve

  def initialize(person, date_time_added, reserve)
    @person = person
    @date_time_added = date_time_added
    @reserve = reserve.downcase == 'true' ||  reserve.downcase == 't'
  end

  # --- Class methods


  # --- Instance methods


end
