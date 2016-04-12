##################################### STAFF MEMBERS #####################################

# Index
get '/staff-members' do
  @staff_members = StaffMember.all
  erb :"staff_members/index"
end

# New
get '/staff-members/new' do
  @staff_member = StaffMember.new
  @libraries = Library.all

  erb :"staff_members/new"
end

# Create
post '/staff-members' do
  # create library object
  @staff_member = StaffMember.new(params)

  if @staff_member.save
    redirect to('/staff-members')
  else
    erb :"staff_members/new"
  end
end

# Show
get '/staff-members/:id' do
  @staff_member = StaffMember.find_by_id(params['id']) # nil or StaffMember object
  erb :"staff_members/show"
end

# Edit

get '/staff-members/:id/edit' do
  @staff_member = StaffMember.find_by_id(params['id'])
  @libraries = Library.all

  erb :"staff_members/edit"
end

post '/staff-members/:id' do
  @staff_member = StaffMember.find_by_id(params['id'])
  @library = Library.find_by_id(params['library_id'])
  @libraries = Library.all

  if @staff_member.update_attributes(name: params['name'], 
                               email: params['email'])
    redirect to("/staff-members/#{@staff_member.id}")
  else
    erb :"staff_members/edit"
  end
end