require( 'sinatra' )
require('sinatra/base')
require( 'sinatra/contrib/all' )
require( 'pry')
require_relative( '../models/membership_type' )
require_relative('../helpers/helpers')
also_reload( '../models/*' )


get '/membershiptypes/sort/:direction/:prop' do
  @membershiptypes = MembershipType.all_ordered(params[:prop], params[:direction])
  erb ("membershiptypes/index".to_sym)
end

# INDEX route
get '/membershiptypes' do
  @membershiptypes = MembershipType.all()
  erb ("membershiptypes/index".to_sym)
end

get '/membershiptypes/new' do
  erb('membershiptypes/new'.to_sym)
end

# DESTROY
post '/membershiptypes/:id/delete' do
  @membershiptype = MembershipType.find_by_id(params[:id])
  @membershiptype.delete()
  redirect ('/membershiptypes')
end

# EDIT
get '/membershiptypes/:id/edit' do
  @membershiptype = MembershipType.find_by_id(params['id'].to_i)
  erb ("membershiptypes/edit".to_sym)
end

# SHOW route
get '/membershiptypes/:id' do
  @membershiptype = MembershipType.find_by_id(params[:id])
  erb('membershiptypes/show'.to_sym)
end


# UPDATE
post '/membershiptypes/:id' do
  @membershiptype = MembershipType.new(params)
  @membershiptype.update()
  redirect ('/membershiptypes')
end

# CREATE
post '/membershiptypes' do
  @membershiptype = MembershipType.new(params)
  @membershiptype.save()
  redirect ('/membershiptypes')
end
