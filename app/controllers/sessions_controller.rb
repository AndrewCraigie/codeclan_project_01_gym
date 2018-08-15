require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry')
require_relative( '../models/person' )
require_relative( '../models/session' )
require_relative( '../models/person_session' )
also_reload( '../models/*' )

get '/sessions/sort/:direction/:prop' do
  @sessions = Session.all_ordered(params[:prop], params[:direction])
  erb ("sessions/index".to_sym)
end

# INDEX route
get '/sessions' do
  @sessions = Session.all()
  erb ("sessions/index".to_sym)
end

get '/sessions/new' do
  erb('sessions/new'.to_sym)
end

# DESTROY
post '/sessions/:id/delete' do
  @session = Session.find_by_id(params[:id])
  @session.delete()
  redirect ('/sessions')
end

# EDIT
get '/sessions/:id/edit' do
  @session = Session.find_by_id(params['id'].to_i)
  erb ("sessions/edit".to_sym)
end

# SHOW route
get '/sessions/show/:id/:class_id/:person_id' do

  @message = ""

  if params['person_id_find'] != nil && params['person_id_find'] != ""
    @person = Person.find_by_id(params['person_id_find'])
    if @person != nil
      @message = "Member Found"
    else
      @message  = "No member with that ID can be found\n
                  Please enter a valid Member ID"
    end
  else
    @person = nil
    @message = "Enter a valid Member ID"
  end

  @gym_class = GymClass.find_by_id(params[:class_id])
  @session = Session.find_by_id(params[:id])
  erb('sessions/show'.to_sym)
end

post '/sessions/show/:id/:class_id/remove/persons' do

  @params_inspect = params.inspect

  @session = Session.find_by_id(params['id'])
  @gym_class = GymClass.find_by_id(params['class_id'])

  params['persons']['remove'].each do |person_id|
    @person = Person.find_by_id(person_id)
    @booking = Booking.new(@person, @session, DateTime.now().to_s, 'false')
    @booking.cancel()
  end

  erb('sessions/show'.to_sym)

end

post '/sessions/show/:id/:class_id/:person_id' do

  @session = Session.find_by_id(params['id'])
  @gym_class = GymClass.find_by_id(params['class_id'])
  @person = Person.find_by_id(params['person_id'])
  reserve = !@session.spaces_available()
  @booking = Booking.new(@person, @session, DateTime.now().to_s, reserve.to_s)
  @booking.save()
  erb('sessions/show'.to_sym)

end




# UPDATE
post '/sessions/:id' do
  @session = Session.new(params)
  @session.update()
  redirect ('/sessions')
end

# CREATE
post '/sessions' do
  @session = Session.new(params)
  @session.save()
  redirect ('/sessions')
end
