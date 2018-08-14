require( 'sinatra' )
require('sinatra/base')
require( 'sinatra/contrib/all' )
require( 'pry')
require_relative( '../models/gym_class_category' )
require_relative('../helpers/helpers')
also_reload( '../models/*' )


get '/gym_class_categories/sort/:direction/:prop' do
  @gym_class_categories = GymClassCategory.all_ordered(params[:prop], params[:direction])
  erb ("gym_class_categories/index".to_sym)
end

# INDEX route
get '/gym_class_categories' do
  @gym_class_categories = GymClassCategory.all()
  erb ("gym_class_categories/index".to_sym)
end

get '/gym_class_categories/new' do
  erb('gym_class_categories/new'.to_sym)
end

# DESTROY
post '/gym_class_categories/:id/delete' do
  @gym_class_category = GymClassCategory.find_by_id(params[:id])
  @gym_class_category.delete()
  redirect ('/gym_class_categories')
end

# EDIT
get '/gym_class_categories/:id/edit' do
  @gym_class_category = GymClassCategory.find_by_id(params['id'].to_i)
  erb ("gym_class_categories/edit".to_sym)
end

# SHOW route
get '/gym_class_categories/:id' do
  @gym_class_category = GymClassCategory.find_by_id(params[:id])
  erb('gym_class_categories/show'.to_sym)
end


# UPDATE
post '/gym_class_categories/:id' do
  @gym_class_category = GymClassCategory.new(params)
  @gym_class_category.update()
  redirect ('/gym_class_categories')
end

# CREATE
post '/gym_class_categories' do
  @gym_class_category = GymClassCategory.new(params)
  @gym_class_category.save()
  redirect ('/gym_class_categories')
end
