require 'sinatra'
require './helpers/sinatra'
require './model/mongodb'
require 'haml'
require 'digest/md5'

require 'net/http'
require 'json'
require 'pp'
require 'uri'


get '/' do
  haml :index
end

get '/user/:id' do
  content_type :json
  u = User.new_from_id(params[:id])
  return u.to_json
end

get '/populate' do
  uri = URI.parse("http://api.randomuser.me/?results=1000")
  data = Net::HTTP.get(uri)
  data = JSON.parse(data)

  results = data['results']
  user_id = 1
  results.each do |value|
    u            = User.new
    u.user_id    = user_id.to_s
    u.email      = value['user']['email']
    u.name       = value['user']['name']['first'] + " " + value['user']['name']['last']
    u.picture    = value['user']['picture']['medium']
    u.username   = value['user']['username']
    u.save
    user_id = user_id + 1
  end
  pp "Sucess"
end
