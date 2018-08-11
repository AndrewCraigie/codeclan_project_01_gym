require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative ('./helpers/helpers.rb')
require_relative('controllers/roles_controller')
also_reload( '../models/*' )

get '/' do
  erb(:index)
end
