require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry')
require_relative( '../models/room' )
also_reload( '../models/*' )

get '/rooms/sort/:direction/:prop' do
  @rooms = Room.all_ordered(params[:prop], params[:direction])
  erb ("rooms/index".to_sym)
end

# INDEX route
get '/rooms' do
  @rooms = Room.all()
  erb ("rooms/index".to_sym)
end

get '/rooms/new' do
  erb('rooms/new'.to_sym)
end

# DESTROY
post '/rooms/:id/delete' do
  @room = Room.find_by_id(params[:id])
  @room.delete()
  redirect ('/rooms')
end

# EDIT
get '/rooms/:id/edit' do
  @room = Room.find_by_id(params['id'].to_i)
  erb ("rooms/edit".to_sym)
end

# SHOW route
get '/rooms/:id' do
  @room = Room.find_by_id(params[:id])
  erb('rooms/show'.to_sym)
end


# UPDATE
post '/rooms/:id' do
  @room = Room.new(params)
  @room.update()
  redirect ('/rooms')
end

# CREATE
post '/rooms' do
  @room = Room.new(params)
  @room.save()
  redirect ('/rooms')
end
