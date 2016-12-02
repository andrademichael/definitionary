class Word

  @@words = []
  attr_reader :spelling, :definition, :pronounciation, :lexical_class

  define_method(:initialize) do |attributes|
    @spelling = attributes.fetch(:spelling)
    @definition = attributes.fetch(:definition)
    @pronounciation = attributes.fetch(:pronounciation)
    @lexical_class = attributes.fetch(:lexical_class)
    @id = @@words.length + 1
  end
