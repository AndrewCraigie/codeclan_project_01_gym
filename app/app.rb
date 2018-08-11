require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative ('./helpers/helpers.rb')

get '/' do
  erb(:index)
end
