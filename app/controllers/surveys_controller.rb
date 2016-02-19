

get '/surveys' do

@surveys = Survey.all
erb :'surveys/all'
end

get '/surveys/new' do
  if logged_in?
    erb :'/surveys/new'
  else
    @errors = ["Must be logged in to create a survey"]
    erb :'/surveys'
end

post '/surveys' do
  @survey = Survey.new(title: params[:title])
  if @survey.save
    erb :"/questions/new"
  else
    @errors = @survey.errors.full_messages
    erb :'/surveys/new'
  end
end