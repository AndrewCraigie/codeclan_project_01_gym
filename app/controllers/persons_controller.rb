require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry')
require_relative( '../models/person' )
require_relative( '../models/role' )
require_relative( '../models/membership' )
also_reload( '../models/*' )

get '/persons/sort/:direction/:prop' do
  @persons = Person.all_ordered(params[:prop], params[:direction])
  erb ("persons/index".to_sym)
end

# INDEX route
get '/persons' do
  @persons = Person.all()
  erb ("persons/index".to_sym)
end

get '/persons/new' do
  @roles = Role.all()
  @membership_types = MembershipType.all()
  erb('persons/new'.to_sym)
end

# DESTROY
post '/persons/:id/delete' do
  @person = Person.find_by_id(params[:id])
  @person.delete()
  redirect ('/persons')
end

# EDIT
get '/persons/:id/edit' do
  @roles = Role.all()
  @person = Person.find_by_id(params['id'].to_i)
  erb ("persons/edit".to_sym)
end

# SHOW route
get '/persons/:id' do
  @person = Person.find_by_id(params[:id])
  erb('persons/show'.to_sym)
end


# UPDATE
post '/persons/:id' do
  @roles = Role.all()
  @person = Person.new(params)
  @person.update()
  redirect ('/persons')
end

# CREATE
post '/persons' do
  @person = Person.new(params)
  @person.save()
  Membership.new_for_member(@person.id, params['membeership_type_id'])
  redirect ('/persons')
end
