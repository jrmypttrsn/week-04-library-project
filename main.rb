require "pry"
require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader"
require 'active_record'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

Dir[File.dirname(__FILE__) + "/app/controllers/*.rb"].each { |file| require file}
Dir[File.dirname(__FILE__) + "/app/models/*.rb"].each { |file| require file}

######################################### HOME #########################################

# Home Page

get '/'do
  erb :home_page
end


