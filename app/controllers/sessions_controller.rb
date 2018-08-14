require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry')
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
get '/sessions/show/:id/:class_id' do
  @gym_class = GymClass.find_by_id(params[:class_id])
  @session = Session.find_by_id(params[:id])
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