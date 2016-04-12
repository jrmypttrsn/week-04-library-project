######################################### BOOKS #########################################

# Index
get '/books' do
  @books = Book.all
  erb :books_index
end

# New
get '/books/new' do
  @book = Book.new
  @libraries = Library.all
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
  @libraries = Library.all
  erb :books_edit
end

post '/books/:id' do
  @book = Book.find_by_id(params['id'])
  @library = Library.find_by_id(params['library_id'])
  @libraries = Library.all

  if @book.update_attributes(title: params['title'], 
                             author: params['author'],
                             isbn: params['isbn'],
                             library: @library)
    redirect to("/books/#{@book.id}")
    else
    	erb :books_edit
  end
end

# Book check out

get '/books/:id/check-out' do

end