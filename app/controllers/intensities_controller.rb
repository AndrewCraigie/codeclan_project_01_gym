require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry')
require_relative( '../models/intensity' )
also_reload( '../models/*' )

get '/intensities/sort/:direction/:prop' do
  @intensities = Intensity.all_ordered(params[:prop], params[:direction])
  erb ("intensities/index".to_sym)
end

# INDEX route
get '/intensities' do
  @intensities = Intensity.all()
  erb ("intensities/index".to_sym)
end

get '/intensities/new' do
  erb('intensities/new'.to_sym)
end

# DESTROY
post '/intensities/:id/delete' do
  @intensity = Intensity.find_by_id(params[:id])
  @intensity.delete()
  redirect ('/intensities')
end

# EDIT
get '/intensities/:id/edit' do
  @intensity = Intensity.find_by_id(params['id'].to_i)
  erb ("intensities/edit".to_sym)
end

# SHOW route
get '/intensities/:id' do
  @intensity = Intensity.find_by_id(params[:id])
  erb('intensities/show'.to_sym)
end


# UPDATE
post '/intensities/:id' do
  @intensity = Intensity.new(params)
  @intensity.update()
  redirect ('/intensities')
end

# CREATE
post '/intensities' do
  @intensity = Intensity.new(params)
  @intensity.save()
  redirect ('/intensities')
end
