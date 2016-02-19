

get '/surveys' do

@surveys = Survey.all
erb :'/'
end

get '/surveys/new' do
  erb :'/surveys/new'
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