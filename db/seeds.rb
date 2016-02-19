un = User.create(username: "Un", email: "Un@smg.com", password: "squirrel")
steven = User.create(username: "Steven", email: "Steven@smg.com", password: "password")
matt = User.create(username: "Matt", email: "Matt@smg.com", password: "foofighters")
devin = User.create(username: "Devin", email: "Devin@smg.com", password: "yourface")

dbc = Survey.create(title: "DBC", author_id: devin.id)

teacher = Question.create(body: "Who is your favorite teacher at DBC?", survey_id: dbc.id)

sam = Choice.create(body: "Sam", question_id: teacher.id)
chris = Choice.create(body: "Chris", question_id: teacher.id)
david = Choice.create(body: "David", question_id: teacher.id)
steven = Choice.create(body: "Steven", question_id: teacher.id)

space = Question.create(body: "What is your favorite space in DBC?", survey_id: dbc.id)
string = Choice.create(body: "String", question_id: space.id)
thread = Choice.create(body: "Thread", question_id: space.id)
kernel = Choice.create(body: "Kernel", question_id: space.id)
therapy = Choice.create(body: "Self", question_id: space.id)

cohort = Question.create(body: "What is your favorite cohort? (other than Squirrels, of course)", survey_id: dbc.id)
frogs = Choice.create(body: "Chorus Frogs", question_id: cohort.id)
foxes = Choice.create(body: "Island Foxes", question_id: cohort.id)
crabs = Choice.create(body: "Fiddler Crabs", question_id: cohort.id)
snakes = Choice.create(body: "Copperheads", question_id: cohort.id)

branded = Question.create(body: "What is your favorite branded item?", survey_id: dbc.id)
stickers = Choice.create(body: "Stickers", question_id: branded.id)
pens = Choice.create(body: "Pens", question_id: branded.id)
pins = Choice.create(body: "Pins", question_id: branded.id)
hoodies = Choice.create(body: "Hoodies", question_id: branded.id)
