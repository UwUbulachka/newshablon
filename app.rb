#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require "sinatra/activerecord"

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base # создание сущности

end

get '/' do
  erb :index
end
