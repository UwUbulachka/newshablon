#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require "sinatra/activerecord"

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base # создание сущности модель
	validates :name, presence: true #validates название метода перпвый символ для проверки
	validates :phone, presence: true 
	validates :datestamp, presence: true 
	validates :color, presence: true 

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
	@c = Client.new
	erb :visit
end

post '/visit' do

	@c = Client.new params[:client] #в визитк изминения
	if @c.save
		erb "<h2>Спасибо, вы записались!</h2>"
	else	
		@error = @c.errors.full_messages.first # в с есть свойство ошибка у ошибки есть массив и у класса масив есть метод фесткотрый возврощает первый элемент массива

		erb :visit
	end	
end	
