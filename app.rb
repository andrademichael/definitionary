require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

#A couple default words to start us off
party = Word.new({:spelling => "party"})
partydef = Definition.new("noun - a gathering of people, may include music")
spinning = Word.new({:spelling => "spinning"})
spinningdef = Definition.new("The act of playing a song, or set of songs, at a party")
party.define_word(partydef)
spinning.define_word(spinningdef)
#Home
get("/") do
  erb(:index)
end

#Create a new word
post("/") do
  spelling = params.fetch("new_word_input")
  word = Word.new({:spelling => spelling})
  erb(:index)
end

#View a single word, add definitions to it
get("/word/:id") do
  @word = Word.find(params.fetch("id"))
  erb(:word)
end

#View a word after adding a definition
post("/word/:id") do
  new_definition = params.fetch("new_def")
  definition = Definition.new(new_definition)
  @word = Word.find(params.fetch("id"))
  @word.define_word(definition)
  erb(:word)
end
