

get '/surveys' do

@surveys = Survey.all
erb :'surveys/all'
end

get '/surveys/new' do
  if logged_in?
    erb :'/surveys/new'
  else
    @errors = ["Must be logged in to create a survey"]
    erb :'index'
  end
end

post '/surveys' do
  @survey = Survey.new(title: params[:title], author_id: current_user.id)
  if @survey.save
    erb :"/questions/new"
  else
    @errors = @survey.errors.full_messages
    erb :'/surveys/new'
  end
end

get '/surveys/:survey_id' do
  @surveys = Survey.all
  @survey = Survey.find(params[:survey_id])
  if logged_in?
    if @survey.author_id == current_user.id
      @errors = ["You can't take your own survey!"]
      erb :'/surveys/all'
    elsif Answer.find_by(survey_id: @survey.id, taker_id: current_user.id)
      @errors = ["You've already taken that survey."]
      erb :'/surveys/all'
    else
    @question = @survey.questions.first
    erb :"/questions/show"
    end
  else
    @errors = ["You must be logged in to take a survey"]
    erb :"index"
  end
end

get '/surveys/:survey_id/stats' do

  @survey = Survey.find(params[:survey_id])

  erb :"/surveys/stats"

end

post '/surveys/graph/:question_id' do

  x= []
  y = []
  question = Question.find(params[:question_id])
  question.choices.each {|c| x << c.body }
  question.choices.each {|c| y << Answer.where(choice_id: c.id).count}
  { x: x, y: y }.to_json
end