require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

#A couple default words to start us off
party = Word.new({:spelling => "party"})
party.define(["noun - a gathering of people, may include music", "verb - To live one's life as Andrew W.K. would."])
spinning = Word.new({:spelling => "spinning"})
spinning.define(["The process of a weaver combining threads into yarn", "The act of playing a song, or set of songs, at a party"])

#Home
get("/") do
  erb(:index)
end

#List all words
get("/words") do
  @words = Word.all
  erb(:words)
end

#Create a new word
post("/") do
  spelling = params.fetch("spelling")
  word = Word.new({spelling => :spelling})
  erb(:index)
end

#View a single word, add definitions to it
get("/word/:id") do

  @word = Word.find(params.fetch("new_word_input"))
  erb(:word)
end
