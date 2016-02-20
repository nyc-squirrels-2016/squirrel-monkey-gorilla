post '/answers' do

  choice = Choice.find(params[:choice])
  question = choice.question
  survey = choice.question.survey

  Answer.create(taker_id: current_user.id, choice_id: params[:choice], question_id: question.id, survey_id: survey.id)

  if survey.answers.size == survey.questions.size
    redirect "/surveys/#{survey.id}/stats"
  else
    @question = Question.find(question.id+1)
    erb :"questions/show"
  end
end