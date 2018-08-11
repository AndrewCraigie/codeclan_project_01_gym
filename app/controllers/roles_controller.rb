require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/role' )
also_reload( '../models/*' )


get '/roles' do
  @roles = Role.all()
  erb ("roles/index".to_sym)
end

get '/roles/:id/edit' do
  @role = Role.find_by_id(params['id'].to_i)
  erb ("roles/show".to_sym)
end
