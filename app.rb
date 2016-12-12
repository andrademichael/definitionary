require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

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
post("/words") do
  spelling = params.fetch("spelling")
  word = Word.new({spelling})
  erb(:index)
end

#View a single word, add definitions to it
get("/word/:id") do
  @word = Word.find(params.fetch("id").to_i())
  erb(:word)
end
