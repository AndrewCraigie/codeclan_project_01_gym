require ('pry')
require_relative ('person')
require_relative ('person_session')
require_relative( '../db/sql_runner' )


class Booking

  attr_reader :person, :session, :date_time_added, :reserve

  def initialize(person, session, date_time_added, reserve)
    @person = person
    @session = session
    @date_time_added = date_time_added
    @reserve = reserve.downcase == 'true' ||  reserve.downcase == 't'

  end

  # --- Class methods


  # --- Instance methods
  def save()
    person_session = PersonSession.new({
      'date_time_added' => @date_time_added,
      'reserve' => @reserve.to_s,
      'person_id' => @person.id,
      'session_id' => @session.id
      })
    person_session.save()
  end

  def cancel()

    person_sessions = PersonSession.find_by_person_session(@person.id, @session.id)

    puts "person sessions found #{person_sessions.count}"
    #person_sessions.each {|person_session| person_session.delete()}

    person_sessions.each do |person_session|
      person_session.delete()
      #PersonSession.update_reserves(@session.id)
    end

    #PersonSession.update_reserves(@session.id)

  end


end
