require 'mongo'
require './model/mongoModule'
require './model/user'

if ENV['RACK_ENV'] == 'production'
  db = URI.parse(ENV['MONGOLAB_URI'])
  db_name = db.path.gsub(/^\//, '')
  DB = Mongo::Connection.new(db.host, db.port).db(db_name)
  DB.authenticate(db.user, db.password) unless (db.user.nil? || db.user.nil?)
else
  DB = Mongo::Connection.new("localhost", 27017).db('random_users')
end

USERS      = DB['users']
