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
  if logged_in?
    @user = User.find_by(id: params[:id])
    erb :'users/show'
  else
    @errors = ["You must be logged in to view a profile"]
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
  @surveys = make_survey_array(params[:id])
  @user = User.find(params[:id])
  @state = "taken"
  erb :'users/select_surveys'
end

def make_survey_array(id)
  answer_array = Answer.select("survey_id").distinct.where(taker_id: id)
  answer_array.map do |answer|
    Survey.find(answer.survey_id)
  end
end
# delete '/users/:id' do
#   delete a user
# end

