require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative ('./helpers/helpers.rb')
also_reload( '../models/*' )

get '/' do
  erb(:index)
end
