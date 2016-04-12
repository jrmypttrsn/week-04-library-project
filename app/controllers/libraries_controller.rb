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

# Library books

get '/libraries/:id/books' do
  @library = Library.find_by_id(params['id'])
  @books = Book.where(library_id: params['id'])
  erb :library_books
end
