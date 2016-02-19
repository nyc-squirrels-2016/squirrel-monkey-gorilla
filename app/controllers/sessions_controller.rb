get '/login' do
  redirect '/' if logged_in?
  erb :'sessions/login'
end

post '/login' do
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = ["Incorrect username or password. Please try again."]
    erb :'sessions/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
