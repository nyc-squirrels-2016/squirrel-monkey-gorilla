get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users/new' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id' do
  if logged_in? && current_user.id == params[:id].to_i
    @user = User.find_by(id: params[:id])
    erb :'users/show'
  else
    @errors = ["You can only view your own profile"]
    erb :'index'
  end
end

get '/users/:id/surveys-written' do
  @surveys = Survey.where(author_id: params[:id])
  @user = User.find(params[:id])
  @state = "written"
  erb :'users/select_surveys'
end

get '/users/:id/surveys-taken' do
  
end

# delete '/users/:id' do
#   delete a user
# end

