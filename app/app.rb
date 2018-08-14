require( 'sinatra' )
require('sinatra/base')
require( 'sinatra/contrib/all' )
require_relative ('helpers/helpers.rb')
require_relative('controllers/roles_controller')
require_relative('controllers/membershiptypes_controller')
require_relative('controllers/rooms_controller')
require_relative('controllers/intensities_controller')
require_relative('controllers/gym_class_categories_controller')
require_relative('controllers/gym_class_categories_controller')
require_relative('controllers/songs_controller')
require_relative('controllers/persons_controller')
also_reload( '../models/*' )



get '/' do
  erb(:index)
end

get '/admin' do
  erb('admin/admin'.to_sym)
end
