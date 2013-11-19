require 'bundler'
Bundler.require(:default)

require 'csv'
set :haml, :format => :html5

get '/' do
  haml :index
end
