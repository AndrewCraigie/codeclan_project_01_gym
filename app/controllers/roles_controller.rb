require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry')
require_relative( '../models/role' )
also_reload( '../models/*' )

# INDEX route
get '/roles' do
  @roles = Role.all()
  erb ("roles/index".to_sym)
end

get '/roles/new' do
  erb('roles/new'.to_sym)
end

# DESTROY
post '/roles/:id/delete' do
  @role = Role.find_by_id(params[:id])
  @role.delete()
  redirect ('/roles')
end

# EDIT
get '/roles/:id/edit' do
  @role = Role.find_by_id(params['id'].to_i)
  erb ("roles/edit".to_sym)
end

# SHOW route
get '/roles/:id' do
  @role = Role.find_by_id(params[:id])
  erb('roles/show'.to_sym)
end


# UPDATE
post '/roles/:id' do
  @role = Role.new(params)
  @role.update()
  redirect ('/roles')
end

# CREATE
post '/roles' do
  @role = Role.new(params)
  @role.save()
  redirect ('/roles')
end
