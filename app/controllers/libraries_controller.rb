####################################### LIBRARIES #######################################

# Index
get '/libraries' do
  @libraries = Library.all
  erb :"libraries/index"
end

# New
get '/libraries/new' do
  @library = Library.new
  erb :"libraries/new"
end

# Create
post '/libraries' do
  # create library object
  @library = Library.new(params)

  if @library.save
    redirect to('/libraries')
  else
    erb :"libraries/new"
  end
end

# Show
get '/libraries/:id' do
  @library = Library.find_by_id(params['id']) # nil or Library object
  erb :"libraries/show"
end

# Edit

get '/libraries/:id/edit' do
  @library = Library.find_by_id(params['id'])
  erb :"libraries/edit"
end

post '/libraries/:id' do
  @library = Library.find_by_id(params['id'])

  if @library.update_attributes(branch_name: params['branch_name'], 
                               phone_number: params['phone_number'], 
                               address: params['address'])
    redirect to("/libraries/#{@library.id}")
  else
    erb :"libraries/edit"
  end
end

# Library Staff Members

get '/libraries/:id/staff-members' do
  @library = Library.find_by_id(params['id'])
  @staff_members = StaffMember.where(library_id: params['id'])
  erb :"library/staff_members"
end

# Library books

get '/libraries/:id/books' do
  @library = Library.find_by_id(params['id'])
  @books = Book.where(library_id: params['id'])
  erb :"library/books"
end
