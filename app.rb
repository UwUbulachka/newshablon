#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require "sinatra/activerecord"

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base # создание сущности

end

class Barber < ActiveRecord::Base #модель
end	

before do 
	
	@barbers = Barber.all

end	


get '/' do
	
	
	erb :index
end

get '/visit' do
	erb :visit
end

post '/visit' do

	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	c = Client.new
	c.name = @username
	c.phone = @phone

	erb "<h2>Спасибо, вы записались!</h2>"

end	
