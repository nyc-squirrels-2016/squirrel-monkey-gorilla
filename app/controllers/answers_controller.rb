post '/answers' do

  choice = Choice.find(params[:choice])
  survey = choice.question.survey
  this_question = choice.question
  questions = survey.questions

  Answer.create(taker_id: current_user.id, choice_id: params[:choice], question_id: this_question.id, survey_id: survey.id)

  if this_question == survey.questions.last 
    redirect "/surveys/#{survey.id}/stats"
  else
    # @question = Question.find(question.id+1)
    index = questions.find_index(this_question)+1
    @question = questions[index]
    erb :"questions/show"
  end
end