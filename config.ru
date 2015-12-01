path = File.expand_path("../", __FILE__)

require 'rubygems'
require 'sinatra'
require 'ostruct'
require "./app"

run Sinatra::Application
