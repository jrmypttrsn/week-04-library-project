require "pry"
require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader"

require_relative "lib/book.rb"
require_relative "lib/library.rb"
require_relative "lib/patron.rb"
require_relative "lib/staff_member.rb"

# binding.pry

######################################### BOOKS #########################################

# Index
get '/books' do
  @books = Book.all
  erb :books_index
end

# New
get '/books/new' do
  @book = Book.new
  erb :books_new
end

# Create
post '/books' do
  # create book object
  @book = Book.new(params)

  if @book.save
    redirect to('/books')
  else
    erb :books_new
  end
end

# Show
get '/books/:id' do
  @book = Book.find_by_id(params['id']) # nil or Book object
  erb :books_show
end

# Edit

get '/books/:id/edit' do
  @book = Book.find_by_id(params['id'])
  @researchers = Library.all
  erb :books_edit
end

post '/books/:id' do
  binding.pry
  @book = Book.find_by_id(params['id'])
  @researcher = Library.find_by_id(params['library_id'])

  if @book.update_attributes(title: params['title'], 
                               author: params['author'],
                               ISBN: @isbn)
    redirect to("/books/#{@book.id}")
  else
    erb :books_edit
  end
end