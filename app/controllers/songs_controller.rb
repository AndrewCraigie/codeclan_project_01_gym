require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry')
require_relative( '../models/song' )
also_reload( '../models/*' )

get '/songs/sort/:direction/:prop' do
  @songs = Song.all_ordered(params[:prop], params[:direction])
  erb ("songs/index".to_sym)
end

# INDEX route
get '/songs' do
  @songs = Song.all()
  erb ("songs/index".to_sym)
end

get '/songs/new' do
  erb('songs/new'.to_sym)
end

# DESTROY
post '/songs/:id/delete' do
  @song = Song.find_by_id(params[:id])
  @song.delete()
  redirect ('/songs')
end

# EDIT
get '/songs/:id/edit' do
  @song = Song.find_by_id(params['id'].to_i)
  erb ("songs/edit".to_sym)
end

# SHOW route
get '/songs/:id' do
  @song = Song.find_by_id(params[:id])
  erb('songs/show'.to_sym)
end


# UPDATE
post '/songs/:id' do
  @song = Song.new(params)
  @song.update()
  redirect ('/songs')
end

# CREATE
post '/songs' do
  @song = Song.new(params)
  @song.save()
  redirect ('/songs')
end
