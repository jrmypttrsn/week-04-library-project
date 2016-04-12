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
  @book = Book.find_by_id(params['id'])

  if @patron.update_attributes(name: params['name'], 
                               email: params['email'])
    redirect to("/patrons/#{@patron.id}")
  else
    erb :patrons_edit
  end
end
