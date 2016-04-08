require "pry"
require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader"

require_relative "lib/book.rb"
require_relative "lib/library.rb"
require_relative "lib/patron.rb"
require_relative "lib/staff_member.rb"
######################################### HOME #########################################

# Home Page

get '/'do
  erb :home_page
end




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

####################################### LIBRARIES #######################################

# Index
get '/libraries' do
  @libraries = Library.all
  erb :libraries_index
end

# New
get '/libraries/new' do
  @library = Library.new
  erb :libraries_new
end

# Create
post '/libraries' do
  # create library object
  @library = Library.new(params)

  if @library.save
    redirect to('/libraries')
  else
    erb :libraries_new
  end
end

# Show
get '/libraries/:id' do
  @library = Library.find_by_id(params['id']) # nil or Library object
  erb :libraries_show
end

# Edit

get '/libraries/:id/edit' do
  @library = Library.find_by_id(params['id'])
  erb :libraries_edit
end

post '/libraries/:id' do
  @library = Library.find_by_id(params['id'])

  if @library.update_attributes(branch_name: params['branch_name'], 
                               phone_number: params['phone_number'], 
                               address: params['address'])
    redirect to("/libraries/#{@library.id}")
  else
    erb :libraries_edit
  end
end

# Library Staff Members

get '/libraries/:id/staff-members' do
  @library = Library.find_by_id(params['id'])
  @staff_members = StaffMember.where(library_id: params['id'])
  erb :library_staff_members
end

##################################### STAFF MEMBERS #####################################

# Index
get '/staff-members' do
  @staff_members = StaffMember.all
  erb :staff_members_index
end

# New
get '/staff-members/new' do
  @staff_member = StaffMember.new
  @libraries = Library.all

  erb :staff_members_new
end

# Create
post '/staff-members' do
  # create library object
  @staff_member = StaffMember.new(params)

  if @staff_member.save
    redirect to('/staff-members')
  else
    erb :staff_members_new
  end
end

# Show
get '/staff-members/:id' do
  @staff_member = StaffMember.find_by_id(params['id']) # nil or StaffMember object
  erb :staff_members_show
end

# Edit

get '/staff-members/:id/edit' do
  @staff_member = StaffMember.find_by_id(params['id'])
  @libraries = Library.all

  erb :staff_members_edit
end

post '/staff-members/:id' do
  @staff_member = StaffMember.find_by_id(params['id'])
  @library = Library.find_by_id(params['library_id'])
  @libraries = Library.all

  if @staff_member.update_attributes(name: params['name'], 
                               email: params['email'])
    redirect to("/staff-members/#{@staff_member.id}")
  else
    erb :staff_members_edit
  end
end

######################################## PATRONS ########################################

# Index
get '/patrons' do
  @patrons = Patron.all
  erb :patrons_index
end

# New
get '/patrons/new' do
  @patron = Patron.new
  erb :patrons_new
end

# Create
post '/patrons' do
  # create library object
  @patron = Patron.new(params)

  if @patron.save
    redirect to('/patrons')
  else
    erb :patrons_new
  end
end

# Show
get '/patrons/:id' do
  @patron = Patron.find_by_id(params['id']) # nil or Patron object
  erb :patrons_show
end

# Edit

get '/patrons/:id/edit' do
  @patron = Patron.find_by_id(params['id'])
  erb :patrons_edit
end

post '/patrons/:id' do
  @patron = Patron.find_by_id(params['id'])

  if @patron.update_attributes(name: params['name'], 
                               email: params['email'])
    redirect to("/patrons/#{@patron.id}")
  else
    erb :patrons_edit
  end
end


