

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

get '/surveys/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  @question = @survey.questions.first
erb :"/questions/show"

end

get '/surveys/:survey_id/stats' do

  @survey = Survey.find(params[:survey_id])

  erb :"/surveys/stats"

end
