post "/questions/:survey_id" do
  question = Question.new(body: params[:question])
  @survey = Survey.find(params[:survey_id])
  if question.save
    @survey.questions << question
    question.choices << Choice.create(body: params[:choice1])
    question.choices << Choice.create(body: params[:choice2])
    question.choices << Choice.create(body: params[:choice3])
    question.choices << Choice.create(body: params[:choice4])
    erb :"/questions/new"
  else
    @errors = question.errors.full_messages
    erb :"/questions/new"
  end
end

post "/questions/:survey_id/done" do



end