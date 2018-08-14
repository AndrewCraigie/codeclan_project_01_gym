require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry')
require_relative( '../models/gym_class' )
require_relative( '../models/intensity' )
also_reload( '../models/*' )

get '/gym_classes/sort/:direction/:prop' do
  @gym_classes = GymClass.all_ordered(params[:prop], params[:direction])
  erb ("gym_classes/index".to_sym)
end

# INDEX route
get '/gym_classes' do
  @intensities = Intensity.all()
  @gym_classes = GymClass.all()
  erb ("gym_classes/index".to_sym)
end

get '/gym_classes/new' do
  @intensities = Intensity.all()
  erb('gym_classes/new'.to_sym)
end

# DESTROY
post '/gym_classes/:id/delete' do
  @gym_class = GymClass.find_by_id(params[:id])
  @gym_class.delete()
  redirect ('/gym_classes')
end

# EDIT
get '/gym_classes/:id/edit' do
  @intensities = Intensity.all()
  @gym_class = GymClass.find_by_id(params['id'].to_i)
  erb ("gym_classes/edit".to_sym)
end

# SHOW route
get '/gym_classes/:id' do
  @gym_class = GymClass.find_by_id(params[:id])
  erb('gym_classes/show'.to_sym)
end


# UPDATE
post '/gym_classes/:id' do
  @gym_class = GymClass.new(params)
  @gym_class.update()
  redirect ('/gym_classes')
end

# CREATE
post '/gym_classes' do
  @gym_class = GymClass.new(params)
  @gym_class.save()
  redirect ('/gym_classes')
end
